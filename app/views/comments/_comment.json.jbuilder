json.extract! comment, :id, :question_id, :course_id, :user_id, :content, :score, :isforumcomment, :created_at, :updated_at
json.url comment_url(comment, format: :json)
