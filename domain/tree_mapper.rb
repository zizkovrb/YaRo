# Tree mapper
require 'yaks'

module Domain
  class TreeMapper < Yaks::Mapper
    link :self, '/trees/{id}'
    attributes :id, :name
  end
end
