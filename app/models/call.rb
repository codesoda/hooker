# represents a single call to a webhook
class Call < ActiveRecord::Base
  belongs_to :hook
  has_many :attempts
  belongs_to :last_attempt, class_name: 'Attempt'

  enum status: {
    pending: 'pending',
    failed: 'failed',
    successful: 'successful'
  }

  after_create :last_call_for_hook
  after_commit :queue_call, only: [:create]

  def refire!
    queue_call
  end

  protected

  def last_call_for_hook
    hook.last_call = self
    hook.save!
  end

  def queue_call
    CallHookWorker.perform_async(id)
  end
end
