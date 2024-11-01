class CommentPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def show?
    user == comment.author ||
      !comment.author.private? ||
      comment.author.followers.include?(user)
  end

  def create?
    true
  end

  # additional authorization steps to ensure only author of comment is able to edit/update or delete their comment
  def edit?
    user == comment.author 
  end

  def update?
    user == comment.author 
  end

  def destroy?
    user == comment.author 
  end
end
