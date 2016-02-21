class ItemsController < ApplicationController

	before_filter :find_item, only: [:show, :edit, :update, :destroy, :upvote]

	def index
		@items = Item.all
		#render text: @items.map { |i|  "#{i.name}: #{i.price}" }.join.("<br/>")
		#render({ text: (@items.map { |i| "#{i.name}: #{i.price}: #{i.description}: #{i.id}" }.join("<br>")) })
		render "items/index"
	end



	# /items/1(или любой другой id) - GET
	def show 
		unless @item 

		render text: "page not found", status: 404
		end
	end


	# /items/new - GET
	def new
		@item = Item.new
	end


	#/items/1/edit - GET


	# /items - POST (данные не видны в строке)
	def create
		#@item = Item.create (name: params[:name], price: params[:price], real: params[:real], weight: params[:weight], description: params[:description])
		#render text: params.inspect #{}"#{@item.id}: #{@item.name} (#{!@item.new_record?})"
		

		@item = Item.create(items_params)

		if @item.errors.empty?
			#render "show"
			redirect_to item_path(@item) #items/:id вновь созданного товара
		else
			render "new"
		end
 
	end

	


	def edit
		
	end

	# /items/1 PUT
	def update
		 #ключ хэша для того чтобы найти в базе данных
		@item.update (params [:item])
		if @item.errors.empty?
			redirect_to redirect_to item_path(@item)
		else
			render "edit"
		end
	end


	# /items/1 DELETE 
	def destroy
		
		@item.destroy
		redirect_to action: "index"
	end

	def upvote
		@item.increment!(params[:votes_counter])
		redirect_to action: :index
	end

private
		def items_params
			params.require(:item).permit(:name, :price, :description, :real, :weight)
		end

		def find_item
			@item = Item.find(params[:id])
		end

		

end
