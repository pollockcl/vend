require 'rails_helper'

context 'the user visits a vending machine show page' do
  scenario 'they can see the snacks' do
    sam = Owner.create(name: "Sam's Snacks")
    vm = sam.machines.create(location: "Don's Mixed Drinks")
    snack1 = vm.snacks.create(name: 'Yummy Gummy', price: 10)
    snack2 = vm.snacks.create(name: 'Dummy Gummy', price: 2)

    visit machine_path(vm)
    

    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack2.name)
    expect(page).to have_content('$' + snack1.price.to_s)
    expect(page).to have_content('$' + snack2.price.to_s)
    expect(page).to have_content('Average Price: $' + vm.average_snack_price.to_s)
  end
end