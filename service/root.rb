# Root of the service
module Service
  # Root route of the whole service
  class Root < Roda
    route do |r|
      response['Content-Type'] = 'application/vnd.api+json'

      r.root do
        { data: { trees: '/trees', positions: '/positions' } }.to_json
      end

      r.on 'trees' do
        r.run Service::Trees
      end

      r.on 'positions' do
        r.run Service::Positions
      end
    end
  end
end
