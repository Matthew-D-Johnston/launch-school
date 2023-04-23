# text_analyzer.rb

# file = File.open("text_analyzer.txt")

# file_data = file.read.split("\n\n") #readlines.map(&:chomp)
# p file_data.size
# p file_data.size
# file_data1 = file.read.split
# p file_data1.size

class TextAnalyzer
  def process
    block_args = yield
    text_file_name = block_args.first
    command = block_args.last
    file = File.open(text_file_name)

    case command
    when "paragraphs"
      num_paragraphs = file.read.split("\n\n").size
      if num_paragraphs == 1
        puts "#{num_paragraphs} paragraph"
      else
        puts "#{num_paragraphs} paragraphs"
      end
    when "lines"
      num_lines = file.readlines.map(&:chomp).size
      if num_lines == 1
        puts "#{num_lines} line"
      else
        puts "#{num_lines} lines"
      end
    when "words"
      num_words = file.read.split.size
      if num_words == 1
        puts "#{num_words} word"
      else
        puts "#{num_words} words"
      end
    end
    
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { ["text_analyzer.txt", "paragraphs"] }
analyzer.process { ["text_analyzer.txt", "lines"] }
analyzer.process { ["text_analyzer.txt", "words"] }
