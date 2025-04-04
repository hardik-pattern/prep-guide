# post, user, comments

fetch post,
      comments,
      current user followers


class Post
  belongs to :user
  has_many :comments
end

# comments of my followers
class Comment
  belongs to :post
  belongs to :user
end

class User
  user has_many :comments
  user has many :posts
  has_many :followings, class name: 'User'
end

# Retrieve post and comments of users follower


# query:
# return post whose comments made by followings
following_ids = User.find(user_id).followings.pluck(:id)
post_ids = Comment.in(user_id: following_ids).pluck(:post_id)
posts = Post.in(id: post_ids)

following_ids = User.find(user_id).followings.pluck(:id)
Post.where('comments.user_id': following_ids).includes(:comments, :user)
