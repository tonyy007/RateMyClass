class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]
  # GET /reviews or /reviews.json
  def noreview
    
  end
  
  def flagpost
    @review = Review.find(params[:review])
    @review.flag = true
    @review.save
    redirect_to(indexlower_path + "?index=" + params[:indexupper])
  end
  
  def unflagpost
    @review = Review.find(params[:review])
    @review.flag = false
    @review.save
    redirect_to(indexlower_path + "?index=" + params[:indexupper])
  end
  
  def pin
    @review = Review.find(params[:review])
    @review.pin = true
    @review.save
    redirect_to(indexlower_path + "?index=" + params[:indexupper])
  end
  
  def unpin
    @review = Review.find(params[:review])
    @review.pin = false
    @review.save
    redirect_to(indexlower_path + "?index=" + params[:indexupper])
  end
  
  def index
    @reviews = Review.order(:course_code, :course_title, :professor_name, :university_name)
  end
  
  def indexupper
    if params[:search] != nil #search bar used
      params[:search].each do |value|
        $searchvalstr = value[1].to_s.downcase
        @searchval = "/" + value[1].to_s.downcase + "/"
      end
      @reviews = Review.order(:course_code, :course_title, :professor_name, :university_name)
      @reviews_search = Array.new
      @reviews.each_with_index do |review, index|
        if (@searchval.match(review.course_code.to_s.downcase) != nil) or (@searchval.match(review.course_title.to_s.downcase) != nil) #choose what to sort by here
          @reviews_search.append(review) 
        elsif (index == @reviews.length - 1) and (@reviews_search.empty?)
          redirect_to({ :action=>'noreview', :controller=>'reviews' })
        end
      end
      @reviews = @reviews_search #from this list combine reviews whose course, prof, uni, etc are equal and display a set of matches to the user
      @reviews_grouped = Array.new #outer layer array for set of grouped reviews of same type
      @reviews_singular = Array.new #inner layer array for grouped reviews of same type
      @i = 0
      @reviews.each do |review|
        if(@i == 0)
          @reviews_singular.append(review)
        elsif((review.course_code == @reviews_singular[@i - 1].course_code) and (review.course_title == @reviews_singular[@i - 1].course_title) and (review.professor_name == @reviews_singular[@i - 1].professor_name) and (review.university_name == @reviews_singular[@i - 1].university_name)) 
          @reviews_singular.append(review)
        else
          @reviews_grouped.append(@reviews_singular.clone)
          @reviews_singular.clear()
          @reviews_singular.append(review)
          @i = 0
        end
        @i += 1
      end
      @reviews_grouped.append(@reviews_singular.clone)
      $reviews_global = @reviews_grouped
      @reviews = @reviews_grouped
    else #search bar not used
      @reviews = Review.order(:course_code, :course_title, :professor_name, :university_name)
      @reviews_grouped = Array.new #outer layer array for set of grouped reviews of same type
      @reviews_singular = Array.new #inner layer array for grouped reviews of same type
      @i = 0
      @reviews.each do |review|
        if(@i == 0)
          @reviews_singular.append(review)
        elsif((review.course_code == @reviews_singular[@i - 1].course_code) and (review.course_title == @reviews_singular[@i - 1].course_title) and (review.professor_name == @reviews_singular[@i - 1].professor_name) and (review.university_name == @reviews_singular[@i - 1].university_name)) 
          @reviews_singular.append(review)
        else
          @reviews_grouped.append(@reviews_singular.clone)
          @reviews_singular.clear()
          @reviews_singular.append(review)
          @i = 0
        end
        @i += 1
      end
      @reviews_grouped.append(@reviews_singular.clone)
      $reviews_global = @reviews_grouped
      @reviews = @reviews_grouped
      #@reviews = Review.all
    end
  end
  
  def indexlower
    @comment = $comment
    @reviews = $reviews_global
    @index = params[:index].to_i
    @reviews[@index].each do |review|
      review.reload
      if review.pin == true
        @reviews[@index].insert(0, @reviews[@index].delete(review))
      end
    end
    workTimearr = Array.new
    studyTimearr = Array.new
    difficultyarr = Array.new
    timeWisharr = Array.new
    @reviews_averaged = Array.new #[workTime, studyTime, difficulty, timeWish]
    @reviews[@index].each_with_index do |review, index|
      workTimearr.append(review.workTime)
      studyTimearr.append(review.studyTime)
      difficultyarr.append(review.diffculty)
      timeWisharr.append(review.timeWish)
    end
    @reviews_averaged.insert(0, workTimearr.inject{ |sum, el| sum + el }.to_f / workTimearr.size)
    @reviews_averaged.insert(1, studyTimearr.inject{ |sum, el| sum + el }.to_f / studyTimearr.size)
    @reviews_averaged.insert(2, difficultyarr.inject{ |sum, el| sum + el }.to_f / difficultyarr.size)
    @reviews_averaged.insert(3, timeWisharr.inject{ |sum, el| sum + el }.to_f / timeWisharr.size)
    
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)
    @review.users_id = session[:current_username]
    respond_to do |format|
      if review_params[:course_code] != "" and @review.save and review_params[:course_title] != "" and review_params[:professor_name] != "" and review_params[:university_name] != "" and review_params[:workTime] != "" and review_params[:studyTime] != "" and review_params[:diffculty] != "" and review_params[:timeWish] != ""
        format.html { redirect_to review_url(@review), notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if review_params[:course_code] != "" and @review.update(review_params) and review_params[:course_title] != "" and review_params[:professor_name] != "" and review_params[:university_name] != "" and review_params[:workTime] != "" and review_params[:studyTime] != "" and review_params[:diffculty] != "" and review_params[:timeWish] != ""
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:workTime, :studyTime, :diffculty, :timeWish, :course_code, :course_title, :professor_name, :university_name, :thought)
    end
end