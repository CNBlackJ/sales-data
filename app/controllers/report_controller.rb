class ReportController < ApplicationController
  def index
    time=Time.new.strftime('%Y%m')

    @projects=["呼噜噜", "KK(inn)", "陶陶居", "飞利浦", "361", "名品代发", "三雄"]
    #总目标
    key1=$redis.keys("*"+":"+time)
    goal_list=$redis.mget(key1)
    @goal_sum=eval [goal_list].join('+')

    #已完成
    key2=$redis.keys(time+"*"+":"+"*"+":"+"*")
    finish_list=$redis.mget(key2)
    @finish_sum=eval [finish_list].join('+')
    #百分比
    @percent=format("%.2f", ((@finish_sum*100).to_f/@goal_sum.to_f))
    @fix_goal=[]
    (0..key1.size-1).each do |n|
      name=key1[n].split(':')[0]
      key3=$redis.keys(time+"*"+":"+name.to_s+":"+"*")
      percent=0
      if !key3.blank?
        list=$redis.mget(key3)
        finish_sum2=eval [list].join('+')
        percent=format("%.2f", ((finish_sum2.to_f)*100/goal_list[n].to_f))
      end
      goal={name: name, goal: goal_list[n], percent: percent}
      @fix_goal.push goal
    end
  end

  def show
    time=Time.new.strftime('%Y%m')
    time2=(Time.new-1.day).strftime('%Y%m%d')
    project=params[:name]
    @goals=$redis.get(project+":"+time)

    key2=$redis.keys(time+"*"+":"+project+":"+"*")
    @finish_sum=0
    @percent=0
    if !key2.blank?
      finish_list=$redis.mget(key2)
      @finish_sum=eval [finish_list].join('+')
      @percent=format("%.2f", ((@finish_sum*100).to_f/@goals.to_f))
    end

    @fix_goal=[]
    (0..key2.size-1).each do |n|
      name=key2[n].split(':')[2]
      key3=$redis.keys(time+"*"+":"+project+":"+name.to_s)
      monthly=0
      daily=0
      if !key3.blank?
        monthly=eval [$redis.mget(key3)].join('+')
      end
      key4=$redis.keys(time2+":"+project+":"+name.to_s)
      if !key4.blank?
        daily=$redis.get(key4)
      end
      goal={name: name, daily: daily, monthly: monthly}
      @fix_goal.push goal
    end
  end

  def add
    @projects=["呼噜噜", "KK(inn)", "陶陶居", "飞利浦", "361", "名品代发", "三雄"]
    @time=Time.new.strftime('%Y年%m月')
  end

  def create
    # r=Redis.new(:host => "192.168.99.100", :port => 32770, :db => 15)
    @projects=[:呼噜噜, :KK, :陶陶居, :飞利浦, "361", :名品代发, :三雄]
    @time=Time.new.strftime('%Y%m')
    @projects.each do |project|
      @project=project.to_s
      @key=@project+":"+@time
      @value=params.require(:projects)[@project]
      if !@value.blank?
        $redis.set(@key, @value)
      end
    end
    redirect_to report_index_path
  end
end
