class AddLastCallToHooks < ActiveRecord::Migration
  def change
    add_reference :hooks, :last_call, index: true
  end
end
