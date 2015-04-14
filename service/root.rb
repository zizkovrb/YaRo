# Root of the service

module Service
  # Root route of the whole service
  class Root < Roda
    plugin :json
    plugin :halt

    route do |r|
      r.root do
        r.halt 200
      end

      r.on 'trees' do
        r.run Service::Trees
      end
    end
  end
end
