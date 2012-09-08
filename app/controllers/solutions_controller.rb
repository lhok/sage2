class SolutionsController < ApplicationController
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
end
