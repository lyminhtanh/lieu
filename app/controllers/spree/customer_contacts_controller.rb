class Spree::CustomerContactsController < Spree::StoreController
  def create
   Spree::CustomerContact.create! customer_contact_params
    render 'show'
  end

  def show

  end

  private
  def customer_contact_params
    params.require(:customer_contact).permit(:name, :email, :phone, :address)
  end

end
