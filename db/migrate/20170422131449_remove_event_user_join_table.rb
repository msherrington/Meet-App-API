class RemoveEventUserJoinTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :events_users
  end
end
