# Tree service route

module Service
  # Trees routes of the service
  class Trees < Roda
    route do |r|
      domain = Domain::Tree
      response['Content-Type'] = "application/vnd.api+json"

      r.is do
        yaksy(domain.all)
      end

      r.is ':id' do |id|
        yaksy(domain[id])
      end
    end

    private
    def yaks
      @yaks ||= Yaks.new do
        default_format :json_api
      end
    end

    def yaksy(object)
      yaks.call(object, env: ENV['RACK_ENV'])
    end
  end
end
