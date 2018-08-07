Spree::HomeController.class_eval do

  def index
    @searcher = build_searcher(params.merge(include_images: true))
    @products = @searcher.retrieve_products
    @products = @products.includes(:possible_promotions) if @products.respond_to?(:includes)
    @taxonomies = Spree::Taxonomy.includes(root: :children)
    @product_categories = @taxonomies.first.root.children
    @brands = @taxonomies.last.root.children
    @customer_contact = Spree::CustomerContact.new
  end
  def self.is_first_item(items, item)
    items.first == item
  end
  def self.gen_product_category_image_tag(taxonomy)
    ActionController::Base.helpers.image_tag Rails.application.routes.url_helpers.rails_representation_url(taxonomy.icon.try(:attachment).variant(resize: "350x150")), class: "d-block w-100" if taxonomy.icon
  end
end
