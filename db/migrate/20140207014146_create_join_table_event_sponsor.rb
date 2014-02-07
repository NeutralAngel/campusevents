class CreateJoinTableEventSponsor < ActiveRecord::Migration
  def change
    create_join_table :events, :sponsors do |t|
      # t.index [:event_id, :sponsor_id]
      # t.index [:sponsor_id, :event_id]
    end
  end
end
