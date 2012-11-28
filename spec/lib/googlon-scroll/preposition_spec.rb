require 'spec_helper'

module GooglonScroll
  describe Preposition do
    let(:seed) { 123 }

    subject do
      Preposition.new seed
    end

    describe 'seed-based rules' do
      it 'should have exactly 5 letters' do
        subject.word_length.should == 5
      end

      it 'should end with a foo letter' do
        subject.last_letter_group.should == :foo
      end

      it 'should not contain the letter "w"' do
        subject.invalid_letter.should == 'w'
      end
    end

    shared_examples_for 'invalid preposition' do
      it 'should return false' do
        subject.valid?(word).should be_false
      end
    end

    shared_examples_for 'valid preposition' do
      it 'should return true' do
        subject.valid?(word).should be_true
      end
    end

    describe '#valid?' do
      context 'for a valid preposition' do
        let(:word) { 'dljbv' }
        it_should_behave_like 'valid preposition'
      end

      context 'for an invalid preposition' do
        context 'when the word is smaller than expected' do
          let(:word) { 'dljv' }
          it_should_behave_like 'invalid preposition'
        end

        context 'when the word is bigger than expected' do
          let(:word) { 'dljbrv' }
          it_should_behave_like 'invalid preposition'
        end

        context 'when the word does not end with a letter of the correct group' do
          let(:word) { 'dljbr' }
          it_should_behave_like 'invalid preposition'
        end

        context 'when the word contains an invalid letter at the middle' do
          let(:word) { 'dlwbr' }
          it_should_behave_like 'invalid preposition'
        end

        context 'when the last letter is an invalid letter of the correct group' do
          let(:word) { 'dljbw' }
          it_should_behave_like 'invalid preposition'
        end
      end
    end
  end
end
