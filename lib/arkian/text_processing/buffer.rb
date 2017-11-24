module Arkian
  module TextProcessing
    class Buffer
      def initialize(filename)
        @filename = filename
        @file = nil
        @buffer = ""
        @last_char = ""
      end

      def next_char
        begin
          next_line if @buffer.empty?
        rescue Errno::ENOENT
          { error: "File not found" }
        rescue EOFError
          close_file
          { error: "End of file" }
        else
          @last_char = @buffer.slice!(0)
        end
      end

      def last_char
        @last_char
      end

      private
      def open_file
        @file = File.open(File.expand_path(@filename))
      end

      def close_file
        @file.close
      end

      def next_line
        open_file if @file.nil?
        @buffer = @file.readline
      end

    end
  end
end
