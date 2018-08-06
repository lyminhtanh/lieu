class CreateSpreeCustomerContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_customer_contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
