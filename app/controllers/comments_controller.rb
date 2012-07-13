class CommentsController < ApplicationController

  def create
  	@post = Post.find params[:post_id]
  	@comment = @post.comments.create params[:comment]
  	redirect_to post_path(@post)
  end

  def destroy
  	@comment = Comment.find params[:id]
  	@comment.destroy

  	respond_to do |format|
  		format.html { redirect_to post_path }
  		format.json { head :no_content }
  	end
end
