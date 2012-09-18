class ServicesController < ApplicationController
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
end
