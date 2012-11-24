module GooglonScroll
  class Letter
    include GooglonScroll::PseudoRandom

    NUMBER_OF_LETTERS = 20
    FOO_QUANTITY_RANGE = 4..7

    def initialize(seed)
      @seed = seed
    end

    def foo?(letter)
      foo_letters.include? letter
    end

    def bar?(letter)
      bar_letters.include? letter
    end

    def foo_letters
      @foo_letters ||= random_alphabet[0...foo_letters_in_alphabet]
    end

    def bar_letters
      @bar_letters ||= random_alphabet[foo_letters_in_alphabet..-1]
    end

    def comparator
      index_of = lambda { |letter| alphabet.index(letter) }

      lambda { |word_1, word_2|
        indexes_1 = word_1.chars.collect &index_of
        indexes_2 = word_2.chars.collect &index_of

        indexes_1 <=> indexes_2
      }
    end

    def alphabet
      @alphabet ||= random_alphabet.shuffle(random: random)
    end

    private

    def foo_letters_in_alphabet
      @foo_letters_in_alphabet ||= new_random.rand FOO_QUANTITY_RANGE
    end

    def random_alphabet
      @random_alphabet ||= ('a'..'z').to_a \
        .shuffle(random: new_random)[0...NUMBER_OF_LETTERS]
    end
  end
end
