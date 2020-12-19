class SerializableTroc < JSONAPI::Serializable::Resource
  type 'trocs'

  attributes :id, :caller_dish_id, :answer_dish_id, :caller_id, :answerer_id, :status, :created_at

  # meta do
  #   { 
  #   }
  # end

end