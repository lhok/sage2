class SolutionsController < ApplicationController
  USER_NAME, PASSWORD = "lrd", "lrd888"
  before_filter :authenticate, :except => [ :index,:show ]

  def index
  	@solutions = Solution.find(:all,:order =>"catalog")
  end

  def new
  	@solution = Solution.new
  end
  
  def create
  	@solution = Solution.new(params[:solution])
  	@solution.save
  	redirect_to solutions_path
  end

  def show
    @solution = Solution.find(params[:id])
    @solutions = Solution.where("catalog = ?",@solution.catalog)
  end

  def edit
    @solution = Solution.find(params[:id])
  end

  def update
    @solution = Solution.find(params[:id])
    respond_to do |format|
      if @solution.update_attributes(params[:solution])
        format.html  { redirect_to(@solution, :notice => 'Successfully updated.') }
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
