require_relative '../service_spec_helper'

RSpec.describe Service::Root do
  it 'has root' do
    get '/'
    expect(last_response.status).to eq 200
  end
end

