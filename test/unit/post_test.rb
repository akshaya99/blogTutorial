require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "Post must not contain empty attributes" do
	post = Post.new
	assert post.invalid?
	assert post.errors[:title].any?
	assert post.errors[:content].any?
  end
end
