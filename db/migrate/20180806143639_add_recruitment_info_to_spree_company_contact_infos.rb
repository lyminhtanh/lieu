class AddRecruitmentInfoToSpreeCompanyContactInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_company_contact_infos, :recruitment_title, :text
    add_column :spree_company_contact_infos, :recruitment_description, :text
  end
end
