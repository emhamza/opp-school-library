require_relative '../person'
require_relative '../capitalizedecorator'
require_relative '../trimmerdecorator'

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'maximilianus') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  context 'When capitalizing a person name' do
    it 'should decorate the person name with proper capitalization' do
      expect(decorator.correct_name).to eq('Maximilianus')
    end
  end
end

describe TrimmerDecorator do
  let(:nameable) { double('Nameable') }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  context 'When trimming a name' do
    context 'when the name is longer than 10 characters' do
      it 'should trim the name to 10 characters' do
        allow(nameable).to receive(:correct_name).and_return('Maximilianus')

        expect(decorator.correct_name).to eq('Maximilian')
      end
    end

    context 'when the name is not longer than 10 characters' do
      it 'should not trim the name' do
        allow(nameable).to receive(:correct_name).and_return('John')

        expect(decorator.correct_name).to eq('John')
      end
    end
  end
end
