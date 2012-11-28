module GooglonScroll
  class Verb < Word
    LENGTH_RANGE = 5..8
    LAST_FOO_LETTER_PROB = 0.8
    FIRST_BAR_LETTER_PROB = 0.7

    def initialize(seed)
      super
    end

    def verb?(word)
      valid_last_letter?(word) and word.length >= word_length
    end

    def subjunctive_verb?(word)
      verb?(word) and valid_first_letter?(word)
    end

    def word_length
      @word_length ||= random.rand LENGTH_RANGE
    end

    def first_letter_group
      @first_letter_group ||= random.rand > FIRST_BAR_LETTER_PROB ? :bar : :foo
    end

    def last_letter_group
      @last_letter_group ||= new_random.rand > LAST_FOO_LETTER_PROB ? :foo : :bar
    end

    private

    def valid_first_letter?(word)
      letter.send "#{first_letter_group}?", word[0]
    end

    def valid_last_letter?(word)
      letter.send "#{last_letter_group}?", word[-1]
    end
  end
end
