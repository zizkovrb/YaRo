require_relative '../service_spec_helper'

RSpec.describe Service::Root do
  it 'has root' do
    get '/'
    expect(last_response.status).to eq 200
  end

  it 'returns service description' do
    get '/'
    expect(last_response.body).to eq %({"data":{"trees":"/trees"}})
  end
end

