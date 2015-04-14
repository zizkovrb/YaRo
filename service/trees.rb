# Tree service route

module Service
  # Trees routes of the service
  class Trees < Roda
    plugin :json

    route do |r|
      r.is do
        yaks.call(Tree.all)
      end

      r.is ':id' do |id|
        yaks.call(Tree[1])
      end
    end

    private
    def yaks
      @yaks = Yaks.new do
        default_format :json_api
      end
    end
  end
end
