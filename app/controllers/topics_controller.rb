class TopicsController < ApplicationController

  layout 'blog'

  before_action :set_sidebar_topics
  before_action :set_topic, only: [:show]

  def index
    @topics = Topic.all
  end

  def show
    if logged_in?(:site_admin)
      @blogs = @topic.blogs.most_recent.page(params[:page]).per(5)
    else
      @blogs = @topic.blogs.published.most_recent.page(params[:page]).per(5)
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def set_sidebar_topics
    @sidebar_topics = Topic.with_blogs
  end
end
