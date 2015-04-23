# Tree mapper
require 'yaks'

module Domain
  # Mapper of the tree for Yaks
  class TreeMapper < Yaks::Mapper
    link :self, '/trees/{id}'
    attributes :id, :name
  end
end
