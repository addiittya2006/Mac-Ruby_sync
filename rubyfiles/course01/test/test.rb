class TestClass

  attr_accessor :max_word


  def calculate_word_frequency(content)
    @line = content
    words = @line.split(' ')
    # print words
    freq = Hash.new(0)
    words1 = Array.new
    highest_wf_words = Array.new
    words.each { |word| words1 << (word.downcase) }
    # print words1
    words1.each { |word| freq[word] += 1 }
    # print freq
    @highest_wf_count = freq.values.sort.reverse![0]
    freq.each do |key, value|
      if value== @highest_wf_count
        highest_wf_words << key
      end
    end
    # highest_wf_words << freq.key(@highest_wf_count)
    # print highest_wf_words
    # print @highest_wf_count
  end

  def analyze_file
    @analyzers = Array.new
    File.open('test.txt').each do |line|
      @count = 1
      @analyzers << line.chomp
      @count += 1
    end
    # print @analyzers
  end

end

test = TestClass.new
test.analyze_file
print test.max_word
# calculate_word_frequency('My name name name is Aditya Aditya Aditya .')
