# Tree service route
module Service
  # Trees routes of the service
  class Trees < Roda
    plugin :default_headers,
           'Content-Type' => 'application/vnd.api+json'
    plugin Yaksi

    route do |r|
      domain Domain::Tree

      r.is do
        yaksi(:all)
      end

      r.is ':id' do |id|
        yaksi(:one, id)
      end
    end
  end
end
