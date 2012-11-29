module GooglonScroll
  class Word
    include GooglonScroll::PseudoRandom

    PRETTY_NUMBER_MIN_RANGE = 50_000..100_000
    PRETTY_NUMBER_DIVISOR_RANGE = 3...15

    attr_reader :letter

    def initialize(seed)
      @letter = Letter.new seed
      @seed   = seed
    end

    def as_number(word)
      n = 0
      word.chars.map { |l| letter.alphabet.index(l) }.each_with_index do |li, i|
        n += li * (Letter::NUMBER_OF_LETTERS ** i)
      end
      n
    end

    def pretty_number?(word_as_number)
      word_as_number >= min_pretty_number and
        word_as_number % pretty_number_divisor == 0
    end

    def pretty_number_divisor
      @pretty_number_divisor ||= new_random(1).rand PRETTY_NUMBER_DIVISOR_RANGE
    end

    def min_pretty_number
      @min_pretty_number ||= new_random.rand PRETTY_NUMBER_MIN_RANGE
    end
  end
end
