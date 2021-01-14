class SerializableTroc < JSONAPI::Serializable::Resource
  type 'trocs'

  attributes :id, :caller_dish_id, :answer_dish_id, :caller_id, :answerer_id, :status, :created_at, :updated_at

  meta do
    { answer_dish: @object.answer_dish.dish,
      caller_dish: @object.caller_dish.dish,
      answerer: @object.answerer,
      caller: @object.caller
    }
  end
end