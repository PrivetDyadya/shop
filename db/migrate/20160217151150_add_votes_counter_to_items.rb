class AddVotesCounterToItems < ActiveRecord::Migration
  def change
  	add_column :items, :votes_counter, :integer, default: 0
  end
end
