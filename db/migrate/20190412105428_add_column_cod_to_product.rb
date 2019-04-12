class AddColumnCodToProduct < ActiveRecord::Migration[5.2]
  def change
  	add_column :products, :cod_eligible, :boolean
  	add_column :products, :iamge_url, :string
  end
end
