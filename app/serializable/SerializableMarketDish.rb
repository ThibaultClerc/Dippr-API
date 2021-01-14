class SerializableMarketDish < JSONAPI::Serializable::Resource
  type 'market_dishes'

  attributes :id, :dish_id, :market_dish_type, :created_at, :end_date

  meta do
    { dish: @object.dish,
      user_lat: @object.dish.user.lat,
      user_first_name: @object.dish.user.first_name,
      user_lng: @object.dish.user.lng,
      tags: @object.dish.tags,
      ingredients: @object.dish.ingredients,
      photo_url: @object.dish.photo_url
    }
  end

end