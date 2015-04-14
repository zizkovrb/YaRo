# Tree model
require 'anima'

module Domain
  module Models
    # Public: Class representing the Tree
    class Tree
      include Anima.new(:id, :name)
      REPOSITORY =
        [
          Tree.new(id: 1, name: 'Beech'),
          Tree.new(id: 2, name: 'Spruce'),
          Tree.new(id: 3, name: 'Oak')
        ]

      def self.all
        REPOSITORY
      end

      def self.[](id)
        REPOSITORY[id-1]
      end
    end
  end
end

