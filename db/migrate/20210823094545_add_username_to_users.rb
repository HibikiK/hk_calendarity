class AddUsernameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    # ユニーク制約の追加
    add_index :users, :username, unique: true
  end
end