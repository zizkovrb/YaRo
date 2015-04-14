# Tree mapper
require 'yaks'

module Domain
  class TreeMapper < Yaks::Mapper
    attributes :id, :name
  end
end
