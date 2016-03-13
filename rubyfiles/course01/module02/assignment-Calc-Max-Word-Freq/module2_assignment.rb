#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  #Implement the following read-only attributes in the LineAnalyzer class.
  attr_accessor :highest_wf_count
  #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  attr_accessor :highest_wf_words
  #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  attr_accessor :content
  #* content          - the string analyzed (provided)
  attr_accessor :line_number
  #* line_number      - the line number analyzed (provided)

  #Add the following methods in the LineAnalyzer class.
  #* initialize() - taking a line of text (content) and a line number
  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    calculate_word_frequency(@content)
  end
  #* calculate_word_frequency() - calculates result
  def calculate_word_frequency(content)
    @line = content
    words = @line.split(' ')
    # print words
    freq = Hash.new(0)
    words1 = Array.new
    self.highest_wf_words = Array.new
    words.each { |word| words1 << (word.downcase) }
    # print words1
    words1.each { |word| freq[word] += 1 }
    # print freq
    @highest_wf_count = freq.values.sort.reverse![0]
    freq.each do |key, value|
      if value== @highest_wf_count
        self.highest_wf_words << key
      end
    end
    # highest_wf_words << freq.key(@highest_wf_count)
    # print highest_wf_words
    # print @highest_wf_count
  end
  #Implement the initialize() method to:
  #* take in a line of text and line number
  #* initialize the content and line_number attributes
  #* call the calculate_word_frequency() method.

  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.
end

#  Implement a class called Solution. 
class Solution

  # Implement the following read-only attributes in the Solution class.
  attr_accessor :analyzers
  # @@analyzers = Array.new

  def initialize
    @analyzers = Array.new
  end

  # print @analyzers
  #* analyzers - an array of LineAnalyzer objects for each line in the file\

  attr_accessor :highest_count_across_lines, :highest_count_words_across_lines
  #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
  #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute 
  #  equal to the highest_count_across_lines determined previously.

  # Implement the following methods in the Solution class.

  def analyze_file
    @count = 1
    File.open('test.txt').each do |line|
      @analyzers << LineAnalyzer.new(line.chomp, @count)
      @count += 1
    end
  end
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.
  def calculate_line_with_highest_frequency
    @max_array = Array.new
    @word_array = Hash.new
    @highest_count_words_across_lines = Array.new
    @analyzers.each do |item|
      @max_array << item.highest_wf_count
      @word_array[item.highest_wf_words] = item.highest_wf_count
    end
    self.highest_count_across_lines = @max_array.max
    @analyzers.each do |key|
      if key.highest_wf_count == @word_array.values.max
        @highest_count_words_across_lines << key
      end
    end
  end

  def print_highest_word_frequency_across_lines
    # print @analyzers
    print "The following words have the highest word frequency per line\n"
    @analyzers.each do |item|
        print "#{item.highest_wf_words}   (appears in line #{item.line_number})\n"
    end
    # print @word_array.values_at(@word_array.keys.max)
  end
  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and 
  #  highest_count_words_across_lines attribute values
  #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in 
  #  highest_count_words_across_lines in the specified format
  
  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file

  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
  #  attribute value determined previously and stores them in highest_count_words_across_lines.

  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format
end
