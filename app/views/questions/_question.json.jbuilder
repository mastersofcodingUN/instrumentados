json.extract! question, :id, :user_id, :course_id, :title, :content, :created_at, :updated_at
json.url question_url(question, format: :json)
