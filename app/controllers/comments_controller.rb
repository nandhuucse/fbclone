class CommentsController < ApplicationController
    def create
        if session[:user_id]
            @user=User.find_by(id: session[:user_id])
        end
        
        params[:comment][:user_id] = @user.id
        @comment=Comment.create(comment_params)
        redirect_to root_path(@post)
    end

    private

    def comment_params
        params.require(:comment).permit(:post_id, :comment, :user_id)
    end
end
