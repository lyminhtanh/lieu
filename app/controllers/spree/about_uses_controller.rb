class Spree::AboutUsesController < Spree::StoreController
  def index
    @about_us = Spree::AboutU.first
  end
end
