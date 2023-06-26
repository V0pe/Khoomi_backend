class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionFixController
  respond_to :json

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :country, :date_of_birth, :email, :password)
  end

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Signed up sucessfully.' },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        status: { message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end
end
