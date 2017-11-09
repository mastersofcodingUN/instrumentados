# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  course_id  :integer
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "metodo ordering" do
    @posts = Post.ordering
    assert_nil @post  #son creados al mismo tiempo por tanto es nil
  end

  test "metodo finding" do
      @post = Post.finding(298486374)
      assert_equal @post.title, "Post dos"
  end
end
