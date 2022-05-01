# reviews controller, controls how reviews are displayed on each page and their various supporting functions; extends application controller
class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]
  # GET /reviews or /reviews.json
  
  # will render the no reviews page when using the search bar
  def noreview
    
  end
  
  # allows for a review to be flagged
  def flagpost
    @review = Review.find(params[:review]) # get review to be flagged
    @review.flag = true # set flag to true on that review
    @review.save
    redirect_to(indexlower_path + "?index=" + params[:indexupper]) # redirect to page user was on
  end
  
  # allows for a review to be unflagged by an admin
  def unflagpost
    @review = Review.find(params[:review]) # get review to be unflagged
    @review.flag = false # set flag to true on that review
    @review.save
    redirect_to(indexlower_path + "?index=" + params[:indexupper]) # redirect to page user was on
  end
  
  # allows for a review to be pinned by a professor
  def pin
    @review = Review.find(params[:review]) # get review to be pinned
    @review.pin = true # set pin to true on that review
    @review.save
    redirect_to(indexlower_path + "?index=" + params[:indexupper]) # redirect to page user was on
  end
  
  # allows for a review to be unpinned by a professor
  def unpin
    @review = Review.find(params[:review]) # get review to be unpinned
    @review.pin = false # set pin to false on that review
    @review.save
    redirect_to(indexlower_path + "?index=" + params[:indexupper]) # redirect to page user was on
  end
  
  # will render the index page: table form showing all reviews 
  def index
    @reviews = Review.order(:course_code, :course_title, :professor_name, :university_name)
  end
  
  # will render the index upper page: showing a top level grouping of reviews by similar type
  def indexupper
    if params[:search] != nil # search bar used
      params[:search].each do |value|
        $searchvalstr = value[1].to_s.downcase # get string in search bar
        @profsearchval = value[1].to_s.downcase.split # split search string
        # construct seperate regexs for professor names
        if !@profsearchval[0].nil?
          @profsearchval[0] = "/" + @profsearchval[0] + "/"
        end
        if !@profsearchval[1].nil?
          @profsearchval[1] = "/" + @profsearchval[1] + "/"
        end
        # construct regex for general search term
        @searchval = "/" + value[1].to_s.downcase + "/"
        @searchvalreg = value[1].to_s.downcase
      end
      
      @reviews = Review.order(:course_code, :course_title, :professor_name, :university_name) # get all reviews in this order
      @reviews_search = Array.new
      @reviews.each_with_index do |review, index| # loop through all reviews
        # try to match reviews with search terms and store matches
        @profnamearr = review.professor_name.to_s.downcase.split
        if @searchvalreg.empty?
          redirect_to({ :action=>'noreview', :controller=>'reviews' })
          break
        elsif !@profnamearr[1].nil? and !@profsearchval[1].nil?
          if ((@searchval.match(review.course_code.to_s.downcase) != nil) or (@searchval.match(review.course_title.to_s.downcase) != nil) or (@profsearchval[0].match(@profnamearr[0]) != nil) or (@profsearchval[1].match(@profnamearr[1]) != nil)) and !review.course_code.nil?   #choose what to sort by here
            @reviews_search.append(review)
          elsif (index == @reviews.length - 1) and (@reviews_search.empty?)
            redirect_to({ :action=>'noreview', :controller=>'reviews' })
          end
        elsif !@profnamearr[1].nil? and @profsearchval[1].nil?
          if ((@searchval.match(review.course_code.to_s.downcase) != nil) or (@searchval.match(review.course_title.to_s.downcase) != nil) or (@profsearchval[0].match(@profnamearr[1]) != nil) or (@profsearchval[0].match(@profnamearr[0]) != nil)) and !review.course_code.nil?   #choose what to sort by here
            @reviews_search.append(review)
          elsif (index == @reviews.length - 1) and (@reviews_search.empty?)
            redirect_to({ :action=>'noreview', :controller=>'reviews' })
          end
        else
          if ((@searchval.match(review.course_code.to_s.downcase) != nil) or (@searchval.match(review.course_title.to_s.downcase) != nil) or (@profsearchval[0].match(@profnamearr[0]) != nil)) and !review.course_code.nil?   #choose what to sort by here
            @reviews_search.append(review)
          elsif (index == @reviews.length - 1) and (@reviews_search.empty?)
            redirect_to({ :action=>'noreview', :controller=>'reviews' })
          end
        end
      end
      @reviews = @reviews_search # from this list combine reviews whose course, prof, uni, etc are equal and display a set of matches to the user
      @reviews_grouped = Array.new # outer layer array for set of grouped reviews of same type
      @reviews_singular = Array.new # inner layer array for grouped reviews of same type
      @i = 0
      @reviews.each do |review| # loop through all matched reviews
        # group reviews of the same type (same prof, uni, dept, and code) into their own sub-arrays
        if(@i == 0) # populate the first review in a set with whatever is next
          @reviews_singular.append(review)
        # if the current review matches the previous one, group it with the previous review
        elsif((review.course_code == @reviews_singular[@i - 1].course_code) and (review.course_title == @reviews_singular[@i - 1].course_title) and (review.professor_name == @reviews_singular[@i - 1].professor_name) and (review.university_name == @reviews_singular[@i - 1].university_name)) 
          @reviews_singular.append(review)
        else # if the current review does not match the previous review, move to the next sub-array
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
    else # search bar not used
      if params[:prof_search] == "true" # if clicked on the show courses with same professor
        @current_professor = params[:prof]
        @courses_with_same_professor = Array.new # create array of other courses taught by this professor
        @reviews = Review.order(:course_code, :course_title, :professor_name, :university_name) # get all reviews
        @reviews.each_with_index do |review, index| # loop through all reviews
          # find all reviews with same professor
          if review.professor_name == @current_professor
            @courses_with_same_professor.append(review.clone)
          end
        end
        if @courses_with_same_professor.empty?
          # no courses with same professor
        else
          @reviews = @courses_with_same_professor
          @reviews_grouped = Array.new # outer layer array for set of grouped reviews of same type
          @reviews_singular = Array.new # inner layer array for grouped reviews of same type
          @i = 0
          @reviews.each do |review| # loop through all matched reviews
            # group reviews of the same type (same prof, uni, dept, and code) into their own sub-arrays
            if(@i == 0) # populate the first review in a set with whatever is next
              @reviews_singular.append(review)
            # if the current review matches the previous one, group it with the previous review
            elsif((review.course_code == @reviews_singular[@i - 1].course_code) and (review.course_title == @reviews_singular[@i - 1].course_title) and (review.professor_name == @reviews_singular[@i - 1].professor_name) and (review.university_name == @reviews_singular[@i - 1].university_name)) 
              @reviews_singular.append(review)
            else # if the current review does not match the previous review, move to the next sub-array
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
        end
      elsif params[:course_search] == "true" # if clicked on the show courses of the same type
        @current_course_code = params[:coursecode]
        @current_course_title = params[:coursetitle]
        # create array of this course taught by other professors
        @same_courses = Array.new
        @reviews = Review.order(:course_code, :course_title, :professor_name, :university_name) # get all reviews
        @reviews.each_with_index do |review, index| # loop through all reviews
          # find all reviews with same course
          if (review.course_code == @current_course_code) and (review.course_title == @current_course_title)
            @same_courses.append(review.clone)
          end
        end
        if @same_courses.empty?
          # no similar courses
        else
          @reviews = @same_courses
          #p @reviews
          @reviews_grouped = Array.new # outer layer array for set of grouped reviews of same type
          @reviews_singular = Array.new # inner layer array for grouped reviews of same type
          @i = 0
          @reviews.each do |review| # loop through all matched reviews
            # group reviews of the same type (same prof, uni, dept, and code) into their own sub-arrays
            if(@i == 0) # populate the first review in a set with whatever is next
              @reviews_singular.append(review)
            # if the current review matches the previous one, group it with the previous review
            elsif((review.course_code == @reviews_singular[@i - 1].course_code) and (review.course_title == @reviews_singular[@i - 1].course_title) and (review.professor_name == @reviews_singular[@i - 1].professor_name) and (review.university_name == @reviews_singular[@i - 1].university_name)) 
              @reviews_singular.append(review)
            else # if the current review does not match the previous review, move to the next sub-array
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
        end
      else
        @reviews = Review.order(:course_code, :course_title, :professor_name, :university_name) # get all reviews
        @reviews_grouped = Array.new # outer layer array for set of grouped reviews of same type
        @reviews_singular = Array.new # inner layer array for grouped reviews of same type
        @i = 0
        @reviews.each do |review| # loop through all matched reviews
          # group reviews of the same type (same prof, uni, dept, and code) into their own sub-arrays 
          if(@i == 0) # populate the first review in a set with whatever is next
            @reviews_singular.append(review)
          # if the current review matches the previous one, group it with the previous review
          elsif((review.course_code == @reviews_singular[@i - 1].course_code) and (review.course_title == @reviews_singular[@i - 1].course_title) and (review.professor_name == @reviews_singular[@i - 1].professor_name) and (review.university_name == @reviews_singular[@i - 1].university_name)) 
            @reviews_singular.append(review)
          else # if the current review does not match the previous review, move to the next sub-array
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
      end
    end
  end
  
  # will render the index lower page: showing the reviews inside each individual larger grouping
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
    # get all user review points from each review in this grouping and average each category for display
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
  # will create a review and add to database
  def create
    @review = Review.new(review_params)
    @review.users_id = session[:current_username]
    respond_to do |format|
      if review_params[:course_code] != "" and @review.save and review_params[:course_title] != "" and review_params[:professor_name] != "" and review_params[:university_name] != "" and review_params[:workTime] != "" and review_params[:studyTime] != "" and review_params[:diffculty] != "" and review_params[:timeWish] != ""
        format.html { redirect_to homepage_path, notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  # will update a singular review and reflect in the database
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
  # will destroy a review and remove from database
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