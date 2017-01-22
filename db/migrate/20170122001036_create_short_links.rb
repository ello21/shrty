class CreateShortLinks < ActiveRecord::Migration
  def change
    create_table :short_links do |t|
      t.string :user_short_key
      t.text :destination_url
      t.integer :http_status

      t.timestamps null: false
    end
  end
end
