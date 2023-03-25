class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end

 private

  def customer_params
    params.require(:customer).permit(:family_name,
                                     :personal_name,
                                     :family_name_ruby,
                                     :personal_name_ruby,
                                     :postcode,
                                     :address,
                                     :telephone_number,
                                     :email,
                                     :is_deleted)
  end
end
