# Tree service route

include Domain

module Service
  # Trees routes of the service
  class Trees < Roda
    route do |r|
      response['Content-Type'] = "application/vnd.api+json"

      r.is do
        yaksy(Tree.all)
      end

      r.is ':id' do |id|
        yaksy(Tree[id])
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
