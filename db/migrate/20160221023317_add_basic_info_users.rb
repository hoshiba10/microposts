class AddBasicInfoUsers < ActiveRecord::Migration
  def change
        add_column :users, :profile, :text
        add_column :users, :prefecture, :string
  end
end
