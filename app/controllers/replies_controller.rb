class RepliesController < ApplicationController


    def create
      @post = Post.find(params[:post_id])
      @reply = Reply.new(reply_params)
      @reply.post = @post
      authorize @reply
      @reply.save
      redirect_to post_path(@post)
    end


    private

    def reply_params
      params.require(:reply).permit(:content).merge(:user_id => current_user.id)
    end
end
