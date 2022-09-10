module ParseFile
  class Export < Struct.new(:file)
    def self.parse(file)
      new(file).parse
    end

    def parse
      load_file
      lines = break_into_lines
      lines.map { |line| break_line(line) }
    end

    def load_file
      @load_file ||= File.read(file)
    end

    def break_into_lines
      load_file.split("\n")
    end

    def break_line(line)
      words = line.split(" ")
      {
        path: words.first,
        access_line: words.last.split('(').first,
        permissions: words.last.split('(').last[0..-2]
      }
    end
  end
end
