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
    
    # def update
    #     respond_to do |format|
    #       if @review.update(comment_params)
    #         format.html { redirect_to (indexlower_path + "?index=" + params[:index]), notice: "Review was successfully updated." }
    #         format.json { render :show, status: :ok, location: @review }
    #       else
    #         format.html { render :edit, status: :unprocessable_entity }
    #         format.json { render json: @review.errors, status: :unprocessable_entity }
    #       end
    #     end
    # end

    
    private
        def comment_params
          params.require(:comment).permit(:body)
        end
end
