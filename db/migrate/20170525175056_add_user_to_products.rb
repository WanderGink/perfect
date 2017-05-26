class AddUserToProducts < ActiveRecord::Migration[5.0]
  def self.up
    change_table :products do |t|
      t.references :user, foreign_key: true
    end
  end

  def self.down
    remove_column :products, :user_id
  end
end
