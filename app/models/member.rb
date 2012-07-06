class Member < ActiveRecord::Base
  attr_accessible :name, :surname, :dept_id, :id
  belongs_to :dept
  validates :name, :surname, :presence => true
end
