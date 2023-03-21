class Public::DestinationsController < ApplicationController
  before_action :authenticate_customer!

  def index
      @destination = Destination.new
      @destinations = Destination.all
  end

  def edit
      @destination = Destination.find(params[:id])
  end

  def create
      destination = Destination.new(destination_params)
      destination.customer_id = current_customer.id
   if destination.save
      redirect_to public_destinations_path
   else
      flash.now[:alert] = '必要な情報を入力してください'
      redirect_to public_destinations_path
   end
  end

  def update
      @destination = Destination.find(params[:id])
   if @destination.update(destination_params)
      redirect_to public_destination_path
   else
      @destination = Destination.find(params[:id])
      flash.now[:alert] = '必要な情報を入力してください'
      render :edit
   end
  end

  def destroy
      destination = Destination.find(params[:id])
      destination.delete
      redirect_to  public_destination_path
  end

  private

  def destination_params
    params.require(:destination).permit(:postcord, :address, :name, :customer_id)
  end

end
