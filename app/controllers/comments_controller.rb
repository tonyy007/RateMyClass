class CommentsController < ApplicationController
    
    def show
        
    end
    
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
    
    def edit
        @review = Review.find(params[:review_id])
        @index =  params[:index].to_i
        @indexupper = params[:indexupper].to_i
        @comment = @review.comments.find(params[:id])
    end
    
    def update
        @review = Review.find(params[:review_id])
        @comment = @review.comments.find(params[:id])
        @comment.update(comment_params)
        redirect_to (indexlower_path + "?index=" + params[:comment][:indexupper])
    #     respond_to do |format|
    #       if @review.update(comment_params)
    #         format.html { redirect_to (indexlower_path + "?index=" + params[:index]), notice: "Review was successfully updated." }
    #         format.json { render :show, status: :ok, location: @review }
    #       else
    #         format.html { render :edit, status: :unprocessable_entity }
    #         format.json { render json: @review.errors, status: :unprocessable_entity }
    #       end
    #     end
    end

    
    private
        def comment_params
          params.require(:comment).permit(:body)
        end
end
