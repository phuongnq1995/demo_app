class CommentsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

  def create
  	@entry = Entry.find_by(id: params[:entry_id])
    @comment = @entry.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

   def comment_params
      params.require(:comment).permit(:content)
    end
end
