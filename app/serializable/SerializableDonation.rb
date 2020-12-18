class SerializableDonation < JSONAPI::Serializable::Resource
  type 'donations'

  attributes :id, :caller_id, :answer_dish_id, :status, :created_at

  # meta do
  #   { 
  #   }
  # end

end