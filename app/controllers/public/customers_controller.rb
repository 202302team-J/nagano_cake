class Public::CustomersController < ApplicationController

  def show
    @customer= current_customer
  end

  def edit
    @customer= current_customer
  end

  def update
    @customer= current_customer
    if @customer.update(customer_params)
      redirect_to my_page_customers_path, notice: "正常に更新されました。"
    else
      render "edit"
    end
  end

  def unsubscribe
  end

  def is_deleted
   @customer= current_customer
   if @customer.update(is_deleted: true)
    sign_out_and_redirect(current_customer)
   else
    render "unsubscribe"
   end
  end

  def withdraw
   @customer= current_customer
   if @customer.update(is_deleted: true)
    sign_out_and_redirect(current_customer)
   else
    render "unsubscribe"
   end
  end

  def customer_params
    params.require(:customer).permit(:family_name, :personal_name, :family_name_ruby, :personal_name_ruby, :postcode, :address, :telephone_number, :email, :is_deleted)
  end

end
