class Product < ApplicationRecord
  # has_one_attached :photo
  has_many :order_products
  has_many :line_items
  before_destroy :not_referenced_by_any_line_item
  monetize :price_cents
  # has_many :orders, through :order_products

  # has_many :components, through: :product_materials

  # scope for product index to allow filtering
  scope :filter_by_category, -> (category) { where category: category }


  # Vladi: Not sure why the associated bit, so commented out
  # Also just did search against name, but you can add category or whatever else
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name ],
    # associated_against: {
    #   description: [ ]
    # },
    using: {
      tsearch: { prefix: true }
    }

  def self.all_categories
    all.map {|p| [ p.category ]}.uniq
  end

  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end
end
