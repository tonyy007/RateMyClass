class CommentsController < ApplicationController
    
    def create
        @review = Review.find(params[:review_id])
        $comment = @review.comments.create(comment_params)
        redirect_to (indexlower_path + "?index=" + params[:comment][:index])
    end
    
     def destroy
        @review = Review.find(params[:review_id])
        @comment = @review.comments.find(params[:id])
        @comment.destroy
        redirect_to (indexlower_path + "?index=" + params[:index])
     end

    
    private
        def comment_params
          params.require(:comment).permit(:body)
        end
end
