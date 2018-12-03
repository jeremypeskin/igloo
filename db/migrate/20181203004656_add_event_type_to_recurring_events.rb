class AddEventTypeToRecurringEvents < ActiveRecord::Migration
  def change
    add_column :recurring_events, :event_type, :integer, default:0
  end
end
