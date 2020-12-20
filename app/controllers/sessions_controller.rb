class SessionsController < Devise::SessionsController

  private

  def respond_with(resource, _opts = {})
    puts current_user
    render  jsonapi: resource,
            fields: { users: [:email, :first_name, :last_name, :is_admin, :city ,:street ,:country ,:zip_code ,:description , :dippers , :phone_number, :nickname, :avatar_url]}
  end

  def respond_to_on_destroy
    head :no_content
  end

end