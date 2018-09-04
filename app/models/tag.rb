class Tag < ActiveRecord::Base
  has_many :tag_maps
  has_many :prototypes, through: :tag_maps
end
