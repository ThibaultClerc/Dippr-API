class SerializableMarketDish < JSONAPI::Serializable::Resource
  type 'market_dishes'

  attributes :id, :user_id, :user_dish_id, :market_dish_type

  meta do
    { user_dish: @object.user_dish }
  end

end