# controller for comments on each review; extends application controller
class CommentsController < ApplicationController
    def show
        
    end
    
    # function for flagging a review post for review by an admin
    def flagpost_c
        @comment = Comment.find(params[:comment]) # find the comment in question
        @comment.flag = true # set the flag attribute of the comment to true
        @comment.save
        redirect_to(indexlower_path + "?index=" + params[:indexupper]) # redirect back to the page the user was on
    end
    
    # function for unflagging a review post by an admin
    def unflagpost_c
        @comment = Comment.find(params[:comment]) # find the comment in question
        @comment.flag = false # set the flag attribute of the comment to false
        @comment.save
        redirect_to(indexlower_path + "?index=" + params[:indexupper]) # redirect back to the page the user was on
    end
    
    # create a comment on a review
    def create
        @review = Review.find(params[:review_id]) # find the review to create a comment on
        $comment = @review.comments.create(comment_params) # create the comment
        $comment.users_id = session[:current_username] # set the user id to show who created this comment
        $comment.save
        redirect_to (indexlower_path + "?index=" + params[:comment][:index]) # redirect back to the page the user was on
    end
    
    # destroy a comment on a review
    def destroy
        @review = Review.find(params[:review_id]) # find the review to destroy a comment on
        @comment = @review.comments.find(params[:id]) # find the comment to destroy from that review
        @comment.destroy # destroy comment
        redirect_to (indexlower_path + "?index=" + params[:index]) # redirect back to the page the user was on
    end
    
    # edit a comment on a review
    def edit
        @review = Review.find(params[:review_id]) # find the review containing the comment to be edited
        @index =  params[:index].to_i
        @indexupper = params[:indexupper].to_i
        @comment = @review.comments.find(params[:id]) # find the comment in that review to edit
        # will render the comments edit.html.erb page
    end
    
    # update a comment on a review
    def update
        @review = Review.find(params[:review_id]) # find the review containing the comment to be updated
        @comment = @review.comments.find(params[:id]) # find the comment to be updated in that review
        @comment.update(comment_params) # update the comment
        redirect_to (indexlower_path + "?index=" + params[:comment][:indexupper]) # redirect back to the page the user was on
    end

    
    private
        def comment_params
          params.require(:comment).permit(:body, :users_id)
        end
end
