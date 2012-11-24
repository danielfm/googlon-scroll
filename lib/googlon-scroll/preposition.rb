module GooglonScroll
  class Preposition < Word
    LENGTH_RANGE = 3..6
    LAST_BAR_LETTER_PROB = 0.8

    def initialize(seed)
      super
    end

    def valid?(word)
      new_random
      valid_word_length?(word) and valid_last_letter?(word) and
        valid_letters?(word)
    end

    private

    def valid_word_length?(word)
      word.length == word_length
    end

    def valid_last_letter?(word)
      letter.send "#{last_letter_group}?", word[-1]
    end

    def valid_letters?(word)
      word.chars.all? { |ch| ch != invalid_letter }
    end

    def invalid_letter
      @invalid_letter ||= letter.send("#{last_letter_group}_letters")[0]
    end

    def last_letter_group
      @last_letter_group ||= random.rand > LAST_BAR_LETTER_PROB ? :bar : :foo
    end

    def word_length
      @word_length ||= random.rand LENGTH_RANGE
    end
  end
end
