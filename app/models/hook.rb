# defines a webhook that should be called
class Hook < ActiveRecord::Base
  has_many :calls
  belongs_to :last_call, class_name: 'Call'
end
