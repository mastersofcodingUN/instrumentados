class CommentsController < ApplicationController
	before_action :authorize, :only => [:edit, :destroy]
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:text))
		@comment.user_id = current_user.id if current_user
		@comment.save

		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	end

	def update
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])

		if @comment.update(params[:comment].permit(:text))
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
    end
    private
	def authorize
        @post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		unless @comment.user_id == current_user.id 
			flash[:notice] = "No eres el creador de este mensaje. No puedes realizar esta accion"
			redirect_to root_path
			return false
		end
	end
end