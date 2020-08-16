class BlogsController < ApplicationController
  before_action :set_blog, only: [:show]
  before_action :set_recent_and_popular_posts

  def index
    @blogs = Blog.all.order(id: :desc)
  end

  def show
  end

  private
  def set_blog
    @blog = Blog.find(params[:id])
    @blog.update_attributes!(view_count: @blog.view_count+1, last_viewed_at: Time.now)
    @author = @blog.user&.user_profile
  end

  def set_recent_and_popular_posts
    @recent_blogs = Blog.order(last_viewed_at: :desc).first(5)
    @popular_blogs = Blog.order(view_count: :desc).first(5)
    @top3_blogs = @popular_blogs.first(3)
  end
end
