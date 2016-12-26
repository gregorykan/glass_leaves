class AddUserIdToTexts < ActiveRecord::Migration
  def change
    add_reference :texts, :user, index: true, foreign_key: true
  end
end
