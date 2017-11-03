class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, expect: [:index,:show]
	before_action :authorize, :only => [:edit, :destroy]
    def index
        @posts = Post.all.order("created_at DESC").paginate(:page => params[:page],per_page: 7)
    end

    def show
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to @post
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
		redirect_to root_path
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content)
	end
	def authorize
		@post = Post.find(params[:id])
		unless @post.user_id == current_user.id 
			flash[:notice] = "No eres el creador de este post. No puedes realizar esta accion"
			redirect_to post_path
			return false
		end
	end
end
