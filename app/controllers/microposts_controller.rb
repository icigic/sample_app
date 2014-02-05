class MicropostsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
	before_filter :correct_user, only: :destroy

	def create
		@micropost = current_user.microposts.build(params[:micropost])
		if @micropost.save
			flash[:success] = "Micropost created!"
			redirect_to root_path
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@micropost.destory
		redirect_back_or root_path
	end

	private

		def correct_user
			@micropos = current_user.microposts.find_by_id(params[:id])
			redirect_to root_path if @microposts.nil?
		end
end