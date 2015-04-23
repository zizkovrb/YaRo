require_relative 'service_spec_helper'

RSpec.describe Service::Root do
  it 'has root' do
    get '/'
    expect(last_response.status).to eq 200
  end

  it 'returns service description' do
    get '/'
    expect(last_response.body).to eq %({"data":{"trees":"/trees","positions":"/positions"}})
  end
end

RSpec.describe Service::Trees do
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
      "name": "Beech",
      "href": "/trees/1"
    },
    {
      "type": "trees",
      "id": 2,
      "name": "Spruce",
      "href": "/trees/2"
    },
    {
      "type": "trees",
      "id": 3,
      "name": "Oak",
      "href": "/trees/3"
    }
  ]
}}
      end

      it 'sets json-api media type' do
        get '/trees'
        expect(last_response.header["Content-Type"]).to eq 'application/vnd.api+json'
      end

      it 'returns one three by its id' do
        get '/trees/1'
        expect(last_response.body).to eq %{{
  "data": [
    {
      "type": "trees",
      "id": 1,
      "name": "Beech",
      "href": "/trees/1"
    }
  ]
}}
      end

      it 'returns second three by its id' do
        get '/trees/2'
        expect(last_response.body).to eq %{{
  "data": [
    {
      "type": "trees",
      "id": 2,
      "name": "Spruce",
      "href": "/trees/2"
    }
  ]
}}
      end
    end
  end
end

describe Service::Positions do
  context 'when on the root' do
    it 'has tree root' do
      get '/positions'
      expect(last_response.status).to eq 200
    end
  end
end


