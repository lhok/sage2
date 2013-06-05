class ServicesController < ApplicationController
  USER_NAME, PASSWORD = "lrd", "lrd888"
  before_filter :authenticate, :except => [ :index,:show ]

  def index
    @services = Service.find(:all,:order =>"catalog")
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(params[:service])
    @service.save
    redirect_to services_path
  end

  def show
    @service = Service.find(params[:id])
    @services = Service.where("catalog = ?",@service.catalog)
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    respond_to do |format|
      if @service.update_attributes(params[:service])
        format.html  { redirect_to(@service, :notice => 'Successfully updated.') }
      end
    end
  end
  private
    def authenticate
      authenticate_or_request_with_http_basic do |user_name, password| 
      user_name == USER_NAME && password == PASSWORD
    end
  end
end
