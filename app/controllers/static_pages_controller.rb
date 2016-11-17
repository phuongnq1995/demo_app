class StaticPagesController < ApplicationController
  def home
	if logged_in?
      @entry  = current_user.entries.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @feed_comment_items = @entry.feed.paginate(page: params[:page])
    else
      @entry = Entry.all.build
      @feed_items = Entry.all.paginate(page: params[:page])
      @comment = Comment.all.build
    end
   end
end
