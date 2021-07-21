# frozen_string_literal: true

class CreateScrappers < ActiveRecord::Migration[6.1]
  def change
    create_table :scrappers do |t|
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :native_language
      t.string :target_language
      t.string :source

      t.timestamps
    end
  end
end
