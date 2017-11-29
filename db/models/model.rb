# User model
require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  validates_presence_of :name
  belongs_to :role
  has_many :ad_groups
  has_many :ads, through: :ad_group

  def authenticate(attempted_password)
    if self.password == attempted_password
      true
    else
      false
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end

# Role model
class Role < ActiveRecord::Base
  has_many :users
end

# Ad Group model
class AdGroup < ActiveRecord::Base
  belongs_to :user
  has_many :ads
end

# Ad Category model
class AdCategory < ActiveRecord::Base
  has_many :ads
end

# Ad model
class Ad < ActiveRecord::Base
  belongs_to :ad_group
  belongs_to :ad_category
  has_one :user, through: :ad_group
end
