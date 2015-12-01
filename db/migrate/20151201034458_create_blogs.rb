class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string:title
      t.text:topic
      t.text:description
      t.string:picture
      t.timestamp
    end
  end
end
