class AddRecruitmentFileUrlToSpreeCompanyContactInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_company_contact_infos, :recruitment_file_url, :string
  end
end
