class FeedsController < ApplicationController
  def index
    @baby = Baby.find(session[:baby_id])
    @day = params[:date]&.to_date || Date.today
    @feeds = @baby.feed_list_day(@day)
    @total_feeds = @feeds.pluck(:mililitres).sum || 0
    @feeds_week = @baby.feeds_week_by_day(@day)
    @data = Feed.where(baby_id: @baby.id).where('date >= ?', @day.monday).where('date <= ?', @day.sunday)
    @week_average = Feed.week_average(@feeds_week)
  end

  # GET /feeds/new
  def new
    @user = User.find(session[:user_id])
    @baby = session[:baby_id] ? Baby.find(session[:baby_id]) : nil
    @feed = Feed.new
    if @baby == nil
      respond_to do |format|
        format.html { redirect_to babies_path, notice: 'Selecciona a tu bebé para registrar nueva toma' }
      end
    end
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @baby = Baby.find(session[:baby_id]) || nil
    @user = User.find(session[:user_id])
    @feed = Feed.new(feed_params)
    @feed.baby_id = @baby.id

    respond_to do |format|
      if @feed.save
        format.html { redirect_to feeds_path, notice: 'feed was successfully created.' }
      else
        p @feed.errors.full_messages
        format.html { render :new, notice: @feed.errors.full_messages}
      end
    end
  end

  private

  def feed_params
    params.require(:feed).permit(:date, :hour, :mililitres)
  end
end
