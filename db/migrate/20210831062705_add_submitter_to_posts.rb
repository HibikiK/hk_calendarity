class AddSubmitterToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :submitter, :integer
  end
end
