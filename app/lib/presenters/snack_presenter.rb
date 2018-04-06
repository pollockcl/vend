class SnackPresenter
  def initialize(snack)
    @snack = snack
  end

  def name
    @snack.name
  end

  def price
    '$' + sprintf "%.2f", @snack.price
  end

  def machines
    @snack.machines.map do |machine|
      "* #{machine.location} (#{machine.snacks.size} kinds of snacks, average price of #{machine.average_snack_price})"
    end
  end

end