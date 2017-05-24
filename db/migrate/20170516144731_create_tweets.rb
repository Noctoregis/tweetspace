class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table : do |t|
      t.Date :date
      t.string :url
      t.string: url_image
      t.string: auteur
      t.integer: likes
      t.text :description
      t.timestamps
    end
  end
end