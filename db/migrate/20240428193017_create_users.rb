class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :region
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
