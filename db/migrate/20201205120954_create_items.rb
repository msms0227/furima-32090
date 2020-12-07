class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :name, null: false
      t.text :data, null: false
      t.integer :category_id, null: false
      t.integer :status_id,null: false
      t.integer :delivery_fee_id,null: false
      t.integer :area_id,null: false
      t.integer :days_id,null:false
      t.integer :price,null:false
      t.references :user,foreign_key: true
    end
  end
end
