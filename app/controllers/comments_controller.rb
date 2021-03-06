class CommentsController < ApplicationController
	def new
		@topic = Topic.find(params[:topic_id])
		@comment = Comment.new
	end


	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.topic_id = params[:topic_id]
		if @comment.save
			redirect_to topics_path, success: 'コメントしました'
		else
		  flash.now[:danger] = 'コメントに失敗しました'
		  render :new
		end
	end

	private
	def comment_params
	  params.require(:comment).permit(:body)
	end

end

#test test