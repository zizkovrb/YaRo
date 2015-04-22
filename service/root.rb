# Root of the service

module Service
  # Root route of the whole service
  class Root < Roda
    route do |r|
      response['Content-Type'] = "application/vnd.api+json"

      r.root do
        {data: {trees: "/trees"}}.to_json
      end

      r.on 'trees' do
        r.run Service::Trees
      end
    end
  end
end
