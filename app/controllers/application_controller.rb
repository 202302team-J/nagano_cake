class ApplicationController < ActionController::Base
  
before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  
protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :personal_name, :family_name_ruby, :personal_name_ruby, :email, :postcode, :address, :telephone_number])
                
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
  

end
