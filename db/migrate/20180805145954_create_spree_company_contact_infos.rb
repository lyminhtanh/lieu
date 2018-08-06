class CreateSpreeCompanyContactInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_company_contact_infos do |t|
      t.text :branch_name
      t.text :contact_info_title
      t.text :address
      t.text :phone
      t.text :email
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
