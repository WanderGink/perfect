class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_attached_file :product_image, styles: {thumb: "150x150#"},
    default_url: "https://demo.productdent.com//img/no_product.png"
  validates_attachment_content_type :product_image,
    content_type: /\Aimage\/.*\z/

  has_many :shop_details
  has_many :comment_products, dependent: :destroy
  has_many :rating_product, dependent: :destroy
end
