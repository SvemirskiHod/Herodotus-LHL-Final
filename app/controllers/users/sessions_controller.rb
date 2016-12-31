class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]
  # before_action :authenticate_user!

  def create
    @user = User.find_by(email: params[:username])
    if @user.valid_password?(params[:password])
      render :json => {"signed_in" => true, "user" => @user}.to_json()
    else
      render :json => {"signed_in" => false}
    end
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
