class HomeController < ApplicationController
  def index
  	@link = Link.new
    @top_links = Link.order_by([[:clicks, :desc]]).limit(40)
  end

  def all
    @links = Link.order_by([[:clicks, :desc]]).limit(40).paginate(:page => params[:page], :per_page => 20)
  end
end
