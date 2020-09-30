class CommentsController < ApplicationController
    def create
        byebug
        Comment.create(user_id: params[:user_id], photo_id: params[:photo_id], comment: params[:comment_text])
    end

    private

    def comment_params
        params.require(:comment).permit(:user_id, :photo_id, :comment_text)
    end
end
