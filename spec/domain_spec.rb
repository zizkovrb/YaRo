require_relative '../domain/tree'
require_relative '../domain/tree_mapper'

include Domain

describe Tree do
  context 'when initializing' do
    it 'can be created' do
      Tree.new(id: 1, name: 'Beech')
    end
  end

  context 'when querying' do
    it 'returns three trees as all' do
      expect(Tree.all).to eq [
          Tree.new(id: 1, name: 'Beech'),
          Tree.new(id: 2, name: 'Spruce'),
          Tree.new(id: 3, name: 'Oak')
        ]
    end

    it 'returns one by id' do
      expect(Tree[1]).to eq Tree.new(id: 1, name: 'Beech')
    end

    it 'returns one by id string' do
      expect(Tree['1']).to eq Tree.new(id: 1, name: 'Beech')
    end
  end
end

describe TreeMapper do
  let(:yaks) do
    Yaks.new do
      default_format :json_api
    end
  end
  context 'when mapped' do
    it 'can be called' do
      tree = Tree.new(id: 1, name: 'Beech')
      expect(yaks.call(tree)).to eq %{{
  "data": [
    {
      "type": "trees",
      "id": 1,
      "name": "Beech",
      "href": "/trees/1"
    }
  ]
}}
    end
  end
end
