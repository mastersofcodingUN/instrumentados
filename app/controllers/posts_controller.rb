class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, expect: [:index,:show]
	before_action :authorize, :only => [:edit, :destroy]
  	def index
      	@posts = Post.ordering.paginate(:page => params[:page],per_page: 7)
		@course = Course.find(params[:course_id])
  	end

	def show
		@post_comments = @post.comments.paginate(:page => params[:page], :per_page => 7)
  	end

	def new
		@post = current_user.posts.build
		@course = Course.find(params[:course_id])
	end

	def create
		@course = Course.find(params[:course_id])
		@post = current_user.posts.build(post_params)
		@post.course_id = params[:course_id]
		@post.save

		if @post.save
			redirect_to course_post_path(@course.id,@post.id)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to course_posts_path(@post.course_id)
	end

	private

	def find_post
		@course = Course.find(params[:course_id])
		@post = Post.finding(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content)
	end
	def authorize
		@post = Post.finding(params[:id])
		unless @post.user_id == current_user.id
			flash[:notice] = "No eres el creador de este post. No puedes realizar esta accion"
			redirect_to post_path
			return false
		end
	end
end
