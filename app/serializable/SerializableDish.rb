class SerializableDish < JSONAPI::Serializable::Resource
  
  include Rails.application.routes.url_helpers

  type 'dishes'

  attributes :id, :name, :description, :dish_rating, :user_id, :photo_url

  meta do
    { 
      user_lat: @object.user.lat,
      user_first_name: @object.user.first_name,
      user_lng: @object.user.lng,
      tags: @object.tags,
      ingredients: @object.ingredients
    }
  end

end