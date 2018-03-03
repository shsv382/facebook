class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :email
    	t.string :first_name
    	t.string :last_name
    	t.date :birth_date
    	t.text :self_info

      t.timestamps
    end
  end
end
