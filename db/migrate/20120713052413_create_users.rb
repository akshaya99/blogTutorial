class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :blog_name
      t.string :user_name
      t.string :password
      t.string :password_salt

      t.timestamps
    end
  end
end
