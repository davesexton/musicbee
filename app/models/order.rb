class Order < ActiveRecord::Base
  attr_accessible :address_line_1, :address_line_2, :address_line_3,
                  :address_line_4, :comments, :email_address, :name,
                  :post_code, :reference, :school_name, :telephone,
                  :email_address_confirmation

  has_many :order_items
  accepts_nested_attributes_for :order_items

  validates :name, :address_line_1, :school_name, presence: true
  validates :email_address, confirmation: true
  validates :post_code, format: {
    with: /(^$)|(^((([A-PR-UWYZ])([0-9][0-9A-HJKS-UW]?))|(([A-PR-UWYZ][A-HK-Y])([0-9][0-9ABEHMNPRV-Y]?))\s{0,2}(([0-9])([ABD-HJLNP-UW-Z])([ABD-HJLNP-UW-Z])))|(((GI)(R))\s{0,2}((0)(A)(A)))$)/,
    message: 'format is invalid'}
  validates :telephone, format: {
    with: /(\s*\(?0\d{4}\)?(\s*|-)\d{3}(\s*|-)\d{3}\s*)|(\s*\(?0\d{3}\)?(\s*|-)\d{3}(\s*|-)\d{4}\s*)|(\s*(7|8)(\d{7}|\d{3}(\-|\s{1})\d{4})\s*)/,
    message: 'format is invalid'}
  validates :email_address, format: {
    with: /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/,
    message: 'format is invalid'}

#TODO: validation to check at least one item has been ordered
  def net_total
    order_items.sum(0){|i| i.net_total}
  end

  def gross_total
    order_items.sum(0){|i| i.gross_total}
  end

  def vat_total
    order_items.sum(0){|i| i.vat_total}
  end

end
