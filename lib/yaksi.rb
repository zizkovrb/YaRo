module Yaksi
  class NoDomainError < RuntimeError; end
  module InstanceMethods
    def yaks
      @yaks ||= Yaks.new do
        default_format :json_api
      end
    end

    def yaksi(*args)
      raise NoDomainError if @_domain.nil?

      yaks.call(@_domain.send(*args), env: ENV['RACK_ENV'])
    end

    def domain(klass)
      @_domain = klass
    end
  end
end
