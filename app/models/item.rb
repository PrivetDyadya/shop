class Item < ActiveRecord::Base
	validates :price, numericality: {greater_than: 0, allow_nil: true }
	
	validates :description, presence: true

	after_initialize {puts "init OK"} #Item.new; Item.first
	after_save {puts "saved"} #Item.save; Item.create; Item.update_attributes()
	after_create {puts "have been created"} 
	after_update {puts "update complete"}
	after_destroy {puts "deleted"} #Item.destroy
end
