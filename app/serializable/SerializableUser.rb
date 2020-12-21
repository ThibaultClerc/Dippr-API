class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :id, :email, :is_admin, :first_name, :last_name, :description,
             :city, :street, :country, :zip_code, :dippers, :user_rating, :phone_number, :nickname, :avatar_url, :lat, :lng
  
end