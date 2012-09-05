class Template < ActiveRecord::Base
  attr_accessible :aa, :id
  has_many :messages
end
