json.extract! lecture, :id, :content,:user_id, :attachment, :course_id, :created_at, :updated_at
json.url lecture_url(lecture, format: :json)
