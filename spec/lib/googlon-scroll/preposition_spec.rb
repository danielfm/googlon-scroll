require 'spec_helper'

module GooglonScroll
  describe Preposition do
    let(:seed) { 123 }

    subject do
      Preposition.new seed
    end

    describe '#word_length' do
      it 'should be 5 given the seed' do
        subject.word_length.should == 5
      end

      context 'when called multiple times' do
        it 'should calculate the value once' do
          subject.should_receive(:new_random).once.and_call_original
          3.times { subject.word_length }
        end
      end
    end

    describe '#last_letter_group' do
      it 'should be :foo given the seed' do
        subject.last_letter_group.should == :foo
      end

      context 'when called multiple times' do
        it 'should calculate the value once' do
          subject.should_receive(:new_random).once.and_call_original
          3.times { subject.last_letter_group }
        end
      end
    end

    describe '#invalid_letter' do
      it 'should be "w" given the seed' do
        subject.invalid_letter.should == 'w'
      end

      context 'when called multiple times' do
        it 'should calculate the value once' do
          subject.letter.should_receive(:foo_letters).once.and_call_original
          3.times { subject.invalid_letter }
        end
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
        let(:word) { 'dljbx' }
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
