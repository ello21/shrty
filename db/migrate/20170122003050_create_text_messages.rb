class CreateTextMessages < ActiveRecord::Migration
  def change
    create_table :text_messages do |t|
      t.text :message
      t.string :from_phone_number
      t.string :to_phone_number
      t.references :short_link, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
