class RemoveIamgeUrlFromProduct < ActiveRecord::Migration[5.2]
  def change
  	remove_column :products,:iamge_url
  	add_column :products, :image_url, :string
  end
end
