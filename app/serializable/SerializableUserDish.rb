class SerializableUserDish< JSONAPI::Serializable::Resource
  
  include Rails.application.routes.url_helpers

  type 'user_dishes'

  attributes :id, :name, :description, :dish_rating, :user_id, :photo

  def photo
    rails_representation_url(object.photo, only_path: true) if object.photo.attached?
  end
end