require_relative '../../domain/tree_mapper'

include Domain

describe TreeMapper do
  let(:yaks) do
    Yaks.new do
      default_format :json_api
    end
  end
  context 'when mapped' do
    it 'can be called' do
      tree = Models::Tree.new(id: 1, name: 'Beech')
      expect(yaks.call(tree)).to eq %{{
  "data": [
    {
      "type": "trees",
      "id": 1,
      "name": "Beech"
    }
  ]
}}
    end
  end
end
