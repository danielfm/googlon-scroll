module GooglonScroll
  class Quiz
    include GooglonScroll::PseudoRandom

    TEXT_LENGTH = 5000
    WORD_LENGTH_RANGE = 2..10

    attr_reader :seed, :letter, :word, :verb, :preposition

    def initialize(random_seed=nil)
      @seed = random_seed || Random.new_seed

      @letter      = Letter.new seed
      @word        = Word.new seed
      @verb        = Verb.new seed
      @preposition = Preposition.new seed

      new_random

      yield self if block_given?
    end

    def generate_scroll_text!(words=TEXT_LENGTH)
      alphabet = @letter.alphabet
      words.times.map { |n| random_word_from alphabet }.join ' '
    end

    def count_prepositions_in(scroll)
      words_from(scroll).count { |word| @preposition.valid? word }
    end

    def count_verbs_in(scroll)
      words_from(scroll).count { |word| @verb.verb? word }
    end

    def count_subjunctive_verbs_in(scroll)
      words_from(scroll).count { |word| @verb.subjunctive_verb? word }
    end

    def vocabulary_list_from(scroll)
      words_from(scroll).uniq.sort(&@letter.comparator).join ' '
    end

    def count_distinct_pretty_numbers_in(scroll)
      distinct_numbers = words_from(scroll).map { |word| @word.as_number word }.uniq
      distinct_numbers.count { |n| @word.pretty_number? n }
    end

    private

    def words_from(scroll)
      scroll.split ' '
    end

    def random_word_from(alphabet)
      word_length = random.rand WORD_LENGTH_RANGE
      alphabet.sample(word_length, random: random).join ''
    end
  end
end
