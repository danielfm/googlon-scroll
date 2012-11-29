require 'spec_helper'

module GooglonScroll
  describe Word do
    let(:seed) { 123 }

    subject do
      Word.new seed
    end

    describe '#pretty_number_divisor' do
      it 'should be 5 given the seed' do
        subject.pretty_number_divisor.should == 5
      end

      context 'when called multiple times' do
        it 'should calculate the value once' do
          subject.should_receive(:new_random).once.and_call_original
          3.times { subject.pretty_number_divisor }
        end
      end
    end

    describe '#min_pretty_number' do
      it 'should be 65725 given the seed' do
        subject.min_pretty_number.should == 65725
      end

      context 'when called multiple times' do
        it 'should calculate the value once' do
          subject.should_receive(:new_random).once.and_call_original
          3.times { subject.min_pretty_number }
        end
      end
    end

    describe '#as_number' do
      let(:word) { 'unxgtjbly' }

      it 'should calculate the number for the word' do
        subject.as_number(word).should == 441_384_536_230
      end
    end

    describe '#pretty_number?' do
      context 'when all the rules are followed' do
        it 'should be considered a pretty number' do
          subject.pretty_number?(65725).should be_true
        end
      end

      context 'when the number is not divisible by the expected number' do
        it 'should not be considered a pretty number' do
          subject.pretty_number?(65726).should be_false
        end
      end

      context 'when the number is not greater than or equal to the expected number' do
        it 'should not be considered a pretty number' do
          subject.pretty_number?(65720).should be_false
        end
      end
    end
  end
end
