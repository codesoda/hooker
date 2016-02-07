class Attempt < ActiveRecord::Base
  belongs_to :call

  enum status: {
    failed: 'failed',
    successful: 'successful',
    timeout: 'timeout',
    error: 'error'
  }
end
