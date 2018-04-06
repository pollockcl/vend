require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'relationships' do
    it 'has many machines' do
      sam = Owner.create(name: "Sam's Snacks")
      vm = sam.machines.create(location: "Don's Mixed Drinks")
      vm2 = sam.machines.create(location: "Yeah Yah Ya")
      snack = Snack.create(name: 'Rumbly Tumbly', price: 14)
      vm.snacks << snack
      vm2.snacks << snack

      expect(snack).to respond_to(:machines)
      expect(snack.machines.size).to eq(2)
    end
  end
end
