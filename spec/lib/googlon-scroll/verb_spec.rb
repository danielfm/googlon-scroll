require 'spec_helper'

module GooglonScroll
  describe Verb do
    # This seed generates the following verb rules:
    # - Word length must be at least 7
    # - Last letter must be a bar letter
    # - Is a subjunctive verb is first letter is a foo letter
    let(:seed) { 123 }

    subject do
      Verb.new seed
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
