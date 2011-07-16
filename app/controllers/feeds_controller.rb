class FeedsController < ApplicationController

  # GET /feeds
  def index
    @feeds = Feed.find(:all, :include => :posts)
  end

  # GET /feed/:id
  def show
    @feed = Feed.find(params[:id])

    if stale?(:last_modified => @feed.updated_at)
      render :partial => 'feed', :locals => { :feed => @feed }
    else
      response['Cache-Control'] = 'public, max-age=1'
    end
  end

  # POST /feeds
  def create
    feed = Feed.create! :url => params[:url]
    redirect_to :action => :index
  end

  # POST refresh_feed/:id
  def refresh
    Feed.find(params[:id]).fetch
    head :ok
  end

end
