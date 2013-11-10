class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation

  validates :name,
    presence: true,
    uniqueness: true,
    format:
      {with: /(?=[a-zA-Z]{6,})/,
       message: 'must be at least 6 characters and contain only upper and lowercase letters'}

  validates :password, format: {
    with: /^.*(?=.{8,}).*$/,
    message: 'must be at least 8 characters long'
  }

  validates :password, format: {
    with: /^.*(?=.*[A-Z]).*$/,
    message: 'must contain at least one uppercase letter'
  }

  validates :password, format: {
    with: /^.*(?=.*[a-z]).*$/,
    message: 'must contain at least one lowercase letter'
  }

  validates :password, format: {
    with: /^.*(?=.*[\d]).*$/,
    message: 'must contain at least one digit (0-9)'
  }

  has_secure_password
  after_destroy :ensure_an_admin_remains

  private

    def ensure_an_admin_remains
      raise "Can't delete last user" if User.count.zero?
    end

end
