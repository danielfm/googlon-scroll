require 'spec_helper'

module GooglonScroll
  describe Word do
    let(:seed) { 123 }

    subject do
      Word.new seed
    end

    describe 'seed-based rules' do
      context 'pretty-numbers' do
        it 'should be greater or equal to 65725' do
          subject.min_pretty_number.should == 65725
        end

        it 'should be divisible by 5' do
          subject.pretty_number_divisor.should == 5
        end
      end
    end

    describe '#as_number' do
      let(:word) { 'unxgtjbly' }

      it 'should calculate the number for the word' do
        subject.as_number(word).should == 485_146_769_391
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
