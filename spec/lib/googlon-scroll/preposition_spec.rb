require 'spec_helper'

module GooglonScroll
  describe Preposition do
    # This seed generates the following preposition rules:
    # - Word length must be exactly 5
    # - Last letter must be a foo letter
    # - Must not contain the letter 'w'
    let(:seed) { 123 }

    subject do
      Preposition.new seed
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
