class CommentsController < ApplicationController
    def create
        
        Comment.create(user_id: params[:user_id], photo_id: params[:photo_id], comment: params[:comment_text])
    end

    def update
        current_comment = Comment.find_by(id: params[:id])
        current_comment.update(comment: params[:comment])
        photo = current_comment.photo
        render json: photo
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        comment.destroy
    end

    private

    def comment_params
        params.require(:comment).permit(:user_id, :photo_id, :comment_text)
    end
end
