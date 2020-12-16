class SerializableMarketDish < JSONAPI::Serializable::Resource
  type 'market_dishes'

  attributes :id, :user_dish_id, :market_dish_type, :created_at

  meta do
    { user_dish: @object.user_dish,
      user_lat: @object.user_dish.user.lat,
      user_first_name: @object.user_dish.user.first_name,
      user_lng: @object.user_dish.user.lng,
      tags: @object.user_dish.tags,
      ingredients: @object.user_dish.ingredients,
      photo_url: @object.user_dish.photo_url
    }
  end

end