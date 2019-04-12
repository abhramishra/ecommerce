class RemoveImageUrlFromProduct < ActiveRecord::Migration[5.2]
  def change
  	remove_column :products,:iamge_url
  	add_column :products,:iamge_url,:string
  end
end
