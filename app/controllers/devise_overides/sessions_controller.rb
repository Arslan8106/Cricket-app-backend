# app/controllers/users/sessions_controller.rb
class DeviseOverides::SessionsController < Devise::SessionsController
  def create
    user = User.find_by(email: params[:user]["email"])
    if user && user.valid_password?(params[:user]["password"])
      sign_in user, store: false
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)
      render json: { message: "Login successful", user: user }, status: :ok
    else
      respond_with_error "Invalid email or password", :not_found
    end
  end
end
