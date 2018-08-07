class AddProductDocUrlToSpreeProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_products, :product_doc_url, :text
  end
end
