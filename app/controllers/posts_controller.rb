class PostsController < ApplicationController

  def index
    policy_scope(Post)
    if params[:query].present?
      sql_query = " \
           posts.content ILIKE :query \
           OR users.last_name ILIKE :query \
           OR users.first_name ILIKE :query \

         "
         @posts = Post.joins(:user).where(sql_query, query: "%#{params[:query]}%")

    @post = Post.new
    else
    @posts = Post.all.order("created_at DESC")

    @post = Post.new
    end

  end

  def show
      @post = Post.find(params[:id])
      @reply = Reply.new
      authorize @post
      @reply.post = @post
    end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params) do |post|
      post.user = current_user
      end
      authorize @post
    if @post.save
      redirect_to posts_path
    else
      redirect_to root_path, notice: @post.errors.full_messages.first
    end
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end
end
