require_relative '../../../domain/models/tree'

include Domain::Models
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
  end
end
