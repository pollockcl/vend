require 'rails_helper'

context 'the user visits the snack show page' do
  scenario 'they see snack stats' do
    sam = Owner.create(name: "Sam's Snacks")
    vm1 = sam.machines.create(location: "Don's Mixed Drinks")
    vm1.snacks.create(name: 'Scooby Snacks', price: 20)
    vm2 = sam.machines.create(location: "Batsnacks")
    snack = Snack.create(name: 'Yummy Gummy', price: 10)

    vm1.snacks << snack
    vm2.snacks << snack

    string1 = "* #{vm1.location} (#{vm1.snacks.size} kinds of snacks, average price of #{vm1.average_snack_price})"
    string2 = "* #{vm2.location} (#{vm2.snacks.size} kinds of snacks, average price of #{vm2.average_snack_price})"
    
    visit snack_path(snack)

    expect(page).to have_content(vm1.location)
    expect(page).to have_content(vm2.location)
    expect(page).to have_content(snack.price)
    expect(page).to have_content(string1)
    expect(page).to have_content(string2)
    expect(page).to have_content(vm1.average_snack_price)
    expect(page).to have_content(vm2.average_snack_price)
    expect(page).to have_content(vm1.snacks.size)
    expect(page).to have_content(vm2.snacks.size)
    end
end