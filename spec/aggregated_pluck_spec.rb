require 'rails_helper'

describe '#pluck with aggregation' do
  let!(:person) { Person.create(name: 'Jenna') }
  let!(:pet) { Pet.create(name: 'Fido', age: 5, person: person) }

  context 'when plucking on AssociationRelation' do
    context 'when relation is empty' do
      # These tests pass on 6.0.3.4 but fail on 6.1.0 and 6.1.1

      it 'returns [0] for counting id' do
        expect(person.pets.where(id: []).pluck('count(id)')).to eq([0])
      end

      it 'returns [nil] for average age' do
        expect(person.pets.where(id: []).pluck('avg(age)')).to eq([nil])
      end
    end

    context 'when records exist for relation' do
      # These tests pass on both 6.0.3.4 and 6.1.0

      it 'returns [1] for counting id' do
        expect(person.pets.where(id: pet.id).pluck('count(id)')).to eq([1])
      end

      it 'returns [5] for average age' do
        expect(person.pets.where(id: pet.id).pluck('avg(age)')).to eq([5])
      end
    end
  end
end
