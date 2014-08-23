class UsersController < ApplicationController
	before_filter :authenticate_user!

	def show
	  	@user = User.find(params[:id])
	end

	def mylinks
  		@links = Link.where(:user_id => current_user.id).order_by([[:clicks, :desc]]).limit(40).paginate(:page => params[:page], :per_page => 20)
  	end

end
