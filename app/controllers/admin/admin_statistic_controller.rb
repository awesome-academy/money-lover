class Admin::AdminStatisticController < Admin::BaseAdminController
  def index
    return unless params[:year]
    years = User.pluck(:created_at).map {|item| item.year}.uniq
    @arrayDataPoints = {}
    years.each do |year|
      dataPoint = User.by_created_year(year).group_by {|u| u.created_at.month}.transform_values{|v| v.size}
      arrayDataPoint = convert_hash_to_array_hash dataPoint
      @arrayDataPoints.merge!({year.to_s => arrayDataPoint})
    end
    @arrayDataPointsJSON = @arrayDataPoints.to_json
  end

  def show
    @year = params[:stats_year].to_i
    dataPoint = User.by_created_year(@year).group_by {|u| u.created_at.month}.transform_values{|v| v.size}
    @arrayDataPoint = convert_hash_to_array_hash dataPoint
    @arrayDataPointJSON = @arrayDataPoint.to_json
  end
end
