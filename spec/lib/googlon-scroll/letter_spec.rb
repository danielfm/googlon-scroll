require 'spec_helper'

module GooglonScroll
  describe Letter do
    let(:seed) { 123 }

    let(:foo_letters) { %w{w v o c y z} }
    let(:bar_letters) { %w{d l j b r e a q k x g u n t}  }

    subject do
      Letter.new seed
    end

    describe '#foo_letters' do
      it 'should return an array containing all the foo letters' do
        subject.foo_letters.should == foo_letters
      end

      context 'when called multiple times' do
        it 'should calculate the random alphabet once' do
          subject.should_receive(:random_alphabet).once.and_call_original
          3.times { subject.foo_letters }
        end
      end
    end

    describe '#bar_letters' do
      it 'should return an array containing all the bar letters' do
        subject.bar_letters.should == bar_letters
      end

      context 'when called multiple times' do
        it 'should calculate the random alphabet once' do
          subject.should_receive(:random_alphabet).once.and_call_original
          3.times { subject.bar_letters }
        end
      end
    end

    describe '#foo?' do
      it 'should return true for all foo letters' do
        foo_letters.each do |char|
          subject.foo?(char).should be_true
        end
      end

      it 'should return false otherwise' do
        bar_letters.each do |char|
          subject.foo?(char).should be_false
        end
      end
    end

    describe '#bar?' do
      it 'should return false for all foo letters' do
        foo_letters.each do |char|
          subject.bar?(char).should be_false
        end
      end

      it 'should return true otherwise' do
        bar_letters.each do |char|
          subject.bar?(char).should be_true
        end
      end
    end

    describe '#alphabet' do
      it 'should return the letters in lexicographical order' do
        subject.alphabet.should == %w{x v r a l o w g k c u n j t d e b y z q}
      end

      context 'when called multiple times' do
        it 'should calculate the value once' do
          subject.should_receive(:random_alphabet).once.and_call_original
          3.times { subject.alphabet }
        end
      end
    end

    describe '#comparator' do
      shared_examples_for 'words in lexicographical order' do
        it 'should return the words in order' do
          scrambled_words.sort(&subject.comparator).should == ordered_words
        end
      end

      context 'when comparing words with equal lengths' do
        context 'when only the last letter is different' do
          let(:scrambled_words) { %w{xoa xox} }
          let(:ordered_words)   { %w{xox xoa} }

          it_should_behave_like 'words in lexicographical order'
        end

        context 'when only the first letter is equal' do
          let(:scrambled_words) { %w{xea xox} }
          let(:ordered_words)   { %w{xox xea} }

          it_should_behave_like 'words in lexicographical order'
        end

        context 'when all letters are different' do
          let(:scrambled_words) { %w{box xea} }
          let(:ordered_words)   { %w{xea box} }

          it_should_behave_like 'words in lexicographical order'
        end
      end

      context 'when comparing words of different lengths' do
        context 'when the longer word contains the shorter word' do
          let(:scrambled_words) { %w{xoaw xoa} }
          let(:ordered_words)   { %w{xoa xoaw} }

          it_should_behave_like 'words in lexicographical order'
        end

        context 'when the longer word occurs before the sorter word' do
          let(:scrambled_words) { %w{xowt xoa} }
          let(:ordered_words)   { %w{xoa xowt} }

          it_should_behave_like 'words in lexicographical order'
        end
      end
    end
  end
end
