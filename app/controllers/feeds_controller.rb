class FeedsController < ApplicationController
  def index
    baby_id = session[:baby_id]
    @feeds = Feed.where(baby_id: baby_id).order(:hour)
    @daily_feeds = Feed.where(baby_id: baby_id).where("date > ?", Date.yesterday).pluck(:mililitres).sum
  end

  # GET /feeds/new
  def new
    @user = User.last
    @baby = Baby.find(session[:baby_id])
    @feed = Feed.new
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @baby = Baby.find(session[:baby_id]) || nil
    @user = @baby.user
    @feed = Feed.new(feed_params)
    @feed[:baby_id] = @baby.id
    @feed[:hour] = @feed[:hour].utc

    respond_to do |format|
      if @feed.save
        format.html { redirect_to user_baby_feeds_path(session[:user_id], Baby.last.id), notice: 'feed was successfully created.' }
      else
        p '00000000000000'
        p @feed.errors.full_messages
        p '00000000000000'
        format.html { render :new }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def feed_params
    params.require(:feed).permit(:date, :hour, :mililitres)
  end
end
