	class BlogsController < ApplicationController
	def index
		@blogs = Blog.all
	end

	def new
		@blog = Blog.new
	end

	def create
		blog = Blog.new(blog_params)
		user = User.find_by_id(session[:user_id])
		blog.user_id = user.id
		if blog.save
			flash[:message] = 'Your blog was created successfully'
			redirect_to '/blogs'
		else
			flash[:message] = 'try again'
			render '/blogs/new'
		end
	end

	def show
		@blog = Blog.find_by_id(params[:id])
		# @comment = Comment.new 
	end

	def edit
		@blog = Blog.find_by_id(params[:id])
	end

	def update
		@blog = Blog.find(params[:id])
		if @blog.update(blog_params)
			flash[:message] = 'Your blog was updated successfully'
			redirect_to "/blogs/#{@blog.id}"
		else
			flash[:message] = 'try again' 
			redirect_to "/blogs/#{@blog.id}/edit"
		end
	end

	def destroy
		@blog = Blog.find(params[:id])
		@blog.destroy
		redirect_to new_blog_path
	end

private

def blog_params
	params.require(:blog).permit(:title, :content)
end
def user_params
    params.require(:user).permit(:fname, :lname, :username, :password)
  end


end

