class MachinesController < ApplicationController
  def index
    @owner = Owner.find(params[:owner_id])
  end

  def show
    @machine = Machine.find(params[:id])
    render locals: { average_snack_price: @machine.average_snack_price }
  end
end
