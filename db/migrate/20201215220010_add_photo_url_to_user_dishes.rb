class AddPhotoUrlToUserDishes < ActiveRecord::Migration[6.0]
  def change
    add_column :user_dishes, :photo_url, :string
  end
end
