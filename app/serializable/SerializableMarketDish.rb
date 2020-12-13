class SerializableMarketDish < JSONAPI::Serializable::Resource
  type 'market_dishes'

  attributes :id, :user_dish_id, :market_dish_type

  meta do
    { user_dish: @object.user_dish,
      user_lat: @object.user_dish.user.lat,
      user_lng: @object.user_dish.user.lng,
      tags: @object.user_dish.tags,
      ingredients: @object.user_dish.ingredients
    }
  end

end