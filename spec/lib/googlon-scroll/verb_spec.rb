require 'spec_helper'

module GooglonScroll
  describe Verb do
    let(:seed) { 123 }

    subject do
      Verb.new seed
    end

    describe '#word_length' do
      it 'should be 7 given the seed' do
        subject.word_length.should == 7
      end

      context 'when called multiple times' do
        it 'should calculate the value once' do
          subject.should_receive(:new_random).once.and_call_original
          3.times { subject.word_length }
        end
      end
    end

    describe '#first_letter_group' do
      it 'should be :foo given the seed' do
        subject.first_letter_group.should == :foo
      end

      context 'when called multiple times' do
        it 'should calculate the value once' do
          subject.should_receive(:new_random).once.and_call_original
          3.times { subject.first_letter_group }
        end
      end
    end

    describe '#last_letter_group' do
      it 'should be :bar given the seed' do
        subject.last_letter_group.should == :bar
      end

      context 'when called multiple times' do
        it 'should calculate the value once' do
          subject.should_receive(:new_random).once.and_call_original
          3.times { subject.last_letter_group }
        end
      end
    end

    shared_examples_for 'invalid verb' do
      it 'should return false' do
        subject.verb?(word).should be_false
      end
    end

    shared_examples_for 'invalid subjunctive verb' do
      it 'should return false' do
        subject.subjunctive_verb?(word).should be_false
      end
    end

    shared_examples_for 'valid verb' do
      it 'should return true' do
        subject.verb?(word).should be_true
      end
    end

    shared_examples_for 'valid subjunctive verb' do
      it 'should return true' do
        subject.subjunctive_verb?(word).should be_true
      end
    end

    describe '#verb?' do
      context 'for a valid verb' do
        let(:word) { 'dljbrea' }
        it_should_behave_like 'valid verb'

        context 'when the word is bigger than expected' do
          let(:word) { 'dljbreaq' }
          it_should_behave_like 'valid verb'
        end
      end

      context 'for an invalid verb' do
        context 'when the word is smaller than expected' do
          let(:word) { 'dljbre' }
          it_should_behave_like 'invalid verb'
        end

        context 'when the word does not end with a letter of the correct group' do
          let(:word) { 'zdljbrw' }
          it_should_behave_like 'invalid verb'
        end
      end
    end

    describe '#subjunctive_verb?' do
      context 'for a valid subjunctive verb' do
        let(:word) { 'wdljbre' }
        it_should_behave_like 'valid subjunctive verb'

        context 'when the word is bigger than expected' do
          let(:word) { 'wdljbrea' }
          it_should_behave_like 'valid subjunctive verb'
        end
      end

      context 'for an invalid subjunctive verb' do
        context 'when the word is smaller than expected' do
          let(:word) { 'wdljbr' }
          it_should_behave_like 'invalid subjunctive verb'
        end

        context 'when the word does not end with a letter of the correct group' do
          let(:word) { 'wdljbrw' }
          it_should_behave_like 'invalid subjunctive verb'
        end

        context 'when the word does not begin with a letter of the correct group' do
          let(:word) { 'zdljbrw' }
          it_should_behave_like 'invalid subjunctive verb'
        end
      end
    end
  end
end
