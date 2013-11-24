class Message < ActiveRecord::Base
  attr_accessible :email, :message, :name

  validates :name, :email, :message, :presence => true
  validates :email, format: { with: %r{.+@.+\..+} }, allow_blank: false

end
