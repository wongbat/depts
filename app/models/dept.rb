class Dept < ActiveRecord::Base
  attr_accessible :name, :dept_id
  validates :name, :presence => true
  has_many :members
end
