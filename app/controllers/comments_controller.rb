class CommentsController < ApplicationController
    
    def create
        @review = Review.find(params[:review_id])
        @comment = @review.comments.create(comment_params)
        redirect_to reviews_path 
    end
    
    private
        def comment_params
          params.require(:comment).permit(:body)
        end
end
