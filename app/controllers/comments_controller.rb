class CommentsController < ApplicationController
def index
        @comments = Comment.all
    end

    def new
        @user = User.find(current_user.id)
        @blog = Blog.find(params[:blog_id])
        @comment = Comment.new
    end

    def create
        user = User.find(current_user.id)
        comment = Comment.new(comment_params)
        comment.user_id = current_user.id
        if comment.save!
            flash[:message] = 'Your comment was posted'
            redirect_to '/comments'
        else
            flash[:message] = 'try again'
            render 'comments/new'
        end
    end

    def show
        @comment = Comment.find_by_id(params[:id])
    end

    def edit
        @comment = Comment.find_by_id(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            flash[:message] = 'Your comment was edited'
            redirect_to "/comments/#{@comment.id}"
        else
            flash[:message] = 'try again'
            render "/comments/#{@comment.id}/edit"
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to new_comment_path
    end

private

def comment_params
    params.require(:comment).permit(:content, :user_id, :blog_id)
end
end
