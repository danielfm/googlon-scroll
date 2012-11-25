require 'spec_helper'

module GooglonScroll
  describe Quiz do
    let(:scroll_text) { load_fixture 'scroll_text.txt' }

    # Doesn't matter, all seed-dependent data will be stubbed
    let(:seed) { 123 }

    let(:letter) { Letter.new seed }
    let(:word)   { Word.new seed }
    let(:verb)   { Verb.new seed }
    let(:preposition) { Preposition.new seed }

    subject { Quiz.new seed }

    before do
      # Rules for letter groups
      letter.stub(:alphabet).and_return %w{l x t k f b p n d j h c z g q w r s m v}
      letter.stub(:foo_letters).and_return %w{n v l s p}
      letter.stub(:bar_letters).and_return %w{x t k f b d j h c z g q w r m}

      # Rules for prepositions
      preposition.stub(:word_length).and_return 4
      preposition.stub(:last_letter_group).and_return :bar
      preposition.stub(:invalid_letter).and_return 'k'
      preposition.stub(:letter).and_return letter

      # Rules for regular and subjunctive verbs
      verb.stub(:word_length).and_return 6
      verb.stub(:first_letter_group).and_return :foo
      verb.stub(:last_letter_group).and_return :bar
      verb.stub(:letter).and_return letter

      # Rules for pretty numbers
      word.stub(:pretty_number_divisor).and_return 5
      word.stub(:min_pretty_number).and_return 804_847
      word.stub(:letter).and_return letter

      Letter.stub(:new).and_return letter
      Word.stub(:new).and_return word
      Verb.stub(:new).and_return verb
      Preposition.stub(:new).and_return preposition
    end

    describe '#generate_scroll_text!' do
      let(:words) { 300 }
      let(:scroll_text) { subject.generate_scroll_text! words }

      it 'should generate a scroll with the specified number of words' do
        scroll_text.split(' ').length.should == words
      end

      it 'should only use valid alphabet letters' do
        scroll_text.split(' ').each do |word|
          word.chars.should be_all { |l| letter.alphabet.include? l }
        end
      end
    end

    describe '#count_prepositions_in' do
      it 'should return the number of prepositions' do
        subject.count_prepositions_in(scroll_text).should == 60
      end
    end

    describe '#count_verbs_in' do
      it 'should return the number of verbs' do
        subject.count_verbs_in(scroll_text).should == 227
      end
    end

    describe '#count_subjunctive_verbs_in' do
      it 'should return the number of subjunctive verbs' do
        subject.count_subjunctive_verbs_in(scroll_text).should == 56
      end
    end

    describe '#vocabulary_list_from' do
      let(:vocabulary_list) { load_fixture 'vocabulary.txt' }

      it 'should sort the distinct words according to the language collation' do
        subject.vocabulary_list_from(scroll_text).should == vocabulary_list
      end
    end

    describe '#count_distinct_pretty_numbers_in' do
      it 'should return the number of distinct pretty numbers' do
        subject.count_distinct_pretty_numbers_in(scroll_text).should == 79
      end
    end
  end
end
