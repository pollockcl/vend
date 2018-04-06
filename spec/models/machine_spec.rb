require 'rails_helper'

describe 'instance methods' do
  it '.average_snack_price' do
    sam = Owner.create(name: "Sam's Snacks")
    vm = sam.machines.create(location: "Don's Mixed Drinks")
    snack1 = vm.snacks.create(name: 'Yummy Gummy', price: 10)
    snack2 = vm.snacks.create(name: 'Dummy Gummy', price: 2)

    expect(vm.average_snack_price).to eq(6)
  end
end