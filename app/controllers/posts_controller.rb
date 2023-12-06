class PostsController < ApplicationController
  def index
    @posts = Post.all
    @total_posts = @posts.count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice_create] = "スケジュールを登録しました"
      redirect_to :posts
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice_update] = "スケジュールを更新しました"
      redirect_to :posts
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice_destroy] = "スケジュールを削除しました"
    redirect_to :posts
  end

  private
  def post_params  # プライベートメソッド 
    params.require(:post).permit(:title, :start_date, :end_date, :is_all_day, :memo)
  end

end
