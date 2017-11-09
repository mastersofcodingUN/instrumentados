# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  text       :text
#  score      :integer
#  post_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "prueba de longitud" do
    @user = User.first
    assert @user.save
    @post = Post.new(title: "Titulo del post", content: "Contenido o pregunta del post", user_id: @user.id)
    assert @post.save
    @comment = Comment.new(text: "Un texto lo suficientemente largo para ser aceptado", score: 3, post_id: @post.id, user_id:@user.id)
    assert @comment.save
  end
end
