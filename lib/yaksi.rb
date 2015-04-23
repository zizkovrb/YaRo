module Yaksi
  class NoDomainError < RuntimeError; end
  # Public: module with instance methods included in Roda
  module InstanceMethods
    def yaks
      @yaks ||= Yaks.new do
        default_format :json_api
      end
    end

    def yaksi(*args)
      fail NoDomainError if @_domain.nil?

      yaks.call(@_domain.send(*args), env: ENV['RACK_ENV'])
    end

    def domain(klass)
      @_domain = klass
    end
  end
end
