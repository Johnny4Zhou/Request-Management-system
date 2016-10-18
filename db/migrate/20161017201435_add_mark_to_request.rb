class AddMarkToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :mark, :boolean
  end
end
