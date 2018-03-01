class RepliesController < ApplicationController
  before_action do
     @post = Post.find(params[:post_id])
   end

  def new
     @reply = Reply.new
     authorize @reply
   end

    def create
      @reply = Reply.new(reply_params)
      @reply.post = @post
      authorize @reply
      @reply.save
    end

    private

    def reply_params
      params.require(:reply).permit(:content)
    end
end
