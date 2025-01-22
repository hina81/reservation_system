class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      
      t.string :first_name
      t.string :last_name
      t.string :kana_first_name
      t.string :kana_last_name
      
      t.string :email
      t.string :phone

      t.date :date
      t.time :time

      t.integer :number_of_people
      t.text :message

      t.string :status

      t.timestamps
    end
  end
end
