class AddLastAttemptToCall < ActiveRecord::Migration
  def change
    add_reference :calls, :last_attempt, index: true
  end
end
