class BlogsController < ApplicationController
  def index
    @blogs = Blog.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
  end

  def create
    #newアクションのようにアクション名を書くだけではtextが保存されません。テーブルにtextが保存するような記述を書きましょう。
    Blog.create(blog_params)
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.destroy
    end
  end

  private
  def blog_params
    params.permit(:text)
  end

end
