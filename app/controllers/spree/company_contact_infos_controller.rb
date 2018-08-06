class Spree::CompanyContactInfosController < Spree::StoreController
  def index
    @company_contact_info = Spree::CompanyContactInfo.first
    if @company_contact_info.nil?
      @company_contact_info = Spree::CompanyContactInfo.create!(
        branch_name: "Trụ sở chính",
        contact_info_title: "Thông tin liên hệ",
        address: "125 Nguyễn Trãi, Phường 3, Quận 5, TP.HCM",
        email: "lieu@lieu.vn",
        phone: "02-822-533-095",
        lat: -12.043333,
        lng: -77.028333,
        recruitment_file_url: "http://acrovision.co.uk/wp-content/uploads/2011/10/FX9500_Specifications.pdf",
        recruitment_title: "thông tin tuyển dụng",
        recruitment_description: "Tải file dưới đây để xem thông tin tuyển dụng của chúng tôi. Xin cảm ơn!"
      )
    end
  end
end
