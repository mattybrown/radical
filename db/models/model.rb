# User model
class User < ActiveRecord::Base
  validates_presence_of :name
  has_one :role
  has_many :ad_groups
  has_many :ads, through: :ad_group
end

# Role model
class Role < ActiveRecord::Base
  belongs_to :user
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
