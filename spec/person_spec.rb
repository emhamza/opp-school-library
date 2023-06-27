require_relative '../person'

describe Person do
  context 'When creating a person' do
    it 'should create a person with the correct name' do
      new_person = Person.new(12, 'Person1', false)
      expect(new_person.name).to eq('Person1')
    end

    it 'should create a person with the correct age' do
      new_person = Person.new(24, 'Person2', true)
      expect(new_person.age).to eq(24)
    end
  end
end
