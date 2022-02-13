json.extract! review, :id, :workTime, :studyTime, :diffculty, :timeWish, :created_at, :updated_at, :course_code, :course_title, :professor_name, :university_name
json.url review_url(review, format: :json)
