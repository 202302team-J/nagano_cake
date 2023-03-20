class Public::DestinationsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @destinations = current_customer.destinations
    @destination = Destination.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end
