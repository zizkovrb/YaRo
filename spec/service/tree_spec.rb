require_relative '../service_spec_helper'

RSpec.describe Service::Root do
  context 'when on the root' do
    it 'has tree root' do
      get '/trees'
      expect(last_response.status).to eq 200
    end

    context 'when on the trees' do
      it 'returns all ' do
        get '/trees'
        expect(last_response.body).to eq %{{
  "data": [
    {
      "type": "trees",
      "id": 1,
      "name": "Beech"
    },
    {
      "type": "trees",
      "id": 2,
      "name": "Spruce"
    },
    {
      "type": "trees",
      "id": 3,
      "name": "Oak"
    }
  ]
}}
      end

      it 'returns one three by its id' do
        get '/trees/1' do
          expect(last_response.body).to eq %{{
  "data": [
    {
      "type": "trees",
      "id": 1,
      "name": "Beech"
    }
  ]
}}
        end
      end

    end
  end

end


