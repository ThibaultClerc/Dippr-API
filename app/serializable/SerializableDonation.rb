class SerializableDonation < JSONAPI::Serializable::Resource
  type 'donations'

  attributes :id, :caller_id, :answer_dish_id, :answerer_id, :status, :created_at, :updated_at

  meta do
    { answer_dish: @object.answer_dish.user_dish,
      answerer: @object.answerer,
      caller: @object.caller
    }
  end

end