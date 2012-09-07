class Message < ActiveRecord::Base
  attr_accessible :content, :template_id
  belongs_to :template
  validates :content,:presence => true
  validates :content,:length => {
    :maximum => 20
  }
end
