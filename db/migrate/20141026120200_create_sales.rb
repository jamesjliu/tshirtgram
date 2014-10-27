class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :email
      t.integer :user_id
      t.integer :picture_id
      t.integer :amount
      t.string :size
      t.text :address
      t.string :country
      t.string :postal_code
      t.string :stripe_id
      t.string :stripe_token
      t.date :card_expiration

      t.timestamps
    end
  end
end
