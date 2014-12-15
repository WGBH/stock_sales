module StockSales
  class InputFileReader
    def initialize(file_name)
      @input_rows = self.read_file(file_name)
      @headers = self.headers
      @fields = ["id", "orig_format", "tape_id", "series", "program", "date_portrayed", "event_loc", "c_title", "desc", "keywords", "category", "start_tc", "end_tc", "duration", "broadcast_format", "aspect"]
    end

    def read_file(file_name)
      if File.extname(file_name) != ".csv"
        raise "Must be a .csv file"
      end
      IO.readlines(file_name)
    end

    def clean_row(row)
      row.chomp.split("\t")
    end

    def headers
      clean_row(@input_rows[0])  
    end

    def valid_row?(row)
      if row.size != @headers.size
        raise "An error occurred with clip #{row[0]}."
      else
        return true
      end
    end

    def ingest
      generate_all_hashes.each do |hash|
        clip = Clip.new 
        hash.each do |key, value|
          if key == 'id'
            clip["clip_id"] = value
          elsif value == 'NULL'
            clip["#{key}"] = nil
          else
            clip["#{key}"] = value 
          end
        end
        clip.save!
      end
    end

    def generate_all_hashes
      array = []
      for n in 1...(@input_rows.size)
        array << generate_hash(@input_rows[n]) 
      end
      array
    end

    def generate_hash(row)
      hash = Hash.new
      row = clean_row(row)
      if valid_row?(row)
        for i in 0...@headers.size
          if @fields.include?(@headers[i])
            hash[@headers[i]] = row[i]
          end
        end
      end
      hash.compact
    end
  end
end
