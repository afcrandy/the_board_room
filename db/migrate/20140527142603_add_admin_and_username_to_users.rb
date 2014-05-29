class AddAdminAndUsernameToUsers < ActiveRecord::Migration
	def change
		add_column :users, :admin, :boolean, default: false
		add_column :users, :username, :string

		add_index  :users, :username, unique: true
	end
end
