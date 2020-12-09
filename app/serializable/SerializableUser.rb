class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :id, :email, :is_admin, :first_name, :last_name
  
end