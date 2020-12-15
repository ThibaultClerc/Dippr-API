class SerializableUserDish< JSONAPI::Serializable::Resource
  
  include Rails.application.routes.url_helpers

  type 'user_dishes'

  attributes :id, :name, :description, :dish_rating, :user_id, :photo_url

end