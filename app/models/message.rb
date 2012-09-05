class Message < ActiveRecord::Base
  attr_accessible :content, :template_id
  belongs_to :template
end
