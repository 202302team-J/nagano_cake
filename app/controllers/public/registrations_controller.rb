# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController


  def after_sign_in_path_for(resource)
    my_page_customers_path(current_customer.id)
  end

 

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end



end
