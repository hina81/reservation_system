class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      
      t.string :name
      t.string :email
      t.string :phone
      t.datetime :date
      t.text :message
      t.string :status

      t.timestamps
    end
  end
end
