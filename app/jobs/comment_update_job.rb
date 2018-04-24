class CommentUpdateJob < ApplicationJob
  queue_as :default


  private

  def render_comment(comment, current_user)
    CommentsController.render(partial: 'comments/comment', locals: { comment: comment, current_user: current_user })
  end
end
