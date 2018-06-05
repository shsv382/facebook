class AddImagesTable < ActiveRecord::Migration[5.1]
  def self.up
  	change_table :users do |t|
  		t.has_attached_file :image  	
  		

  		add_foreign_key :image, :user
  	end
  end

  def self.down
  	drop_attached_file :images, :image
  end
end
