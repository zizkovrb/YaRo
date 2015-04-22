# Tree model
require 'anima'

module Domain
  # Public: Class representing the Tree
  class Tree
    include Anima.new(:id, :name)

    # This should be changed to some repository class
    # Maybe add ROM?
    REPOSITORY =
      [
        Tree.new(id: 1, name: 'Beech'),
        Tree.new(id: 2, name: 'Spruce'),
        Tree.new(id: 3, name: 'Oak')
      ]

    def self.all
      REPOSITORY
    end

    def self.one(id)
      REPOSITORY[id.to_i - 1]
    end
  end
end

