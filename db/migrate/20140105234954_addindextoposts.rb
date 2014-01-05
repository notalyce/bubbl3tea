class Addindextoposts < ActiveRecord::Migration
  def change
    add_index :posts, :slug
  end
end
