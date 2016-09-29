class DailySalesController < ApplicationController

  def index
    @projects = Project.all #Redisdb.getter('project')
  end

  def add
    @platforms = Redisdb.get_project_platforms(params[:name])
  end

  def create
    puts sales_params
    respond_to do |format|
      if Project.save_turnover()
        format.html { redirect_to daily_sales_add_path, notice: '保存成功' }
      end
    end
  end

  private
    def sales_params
     request.parameters
    end
end
