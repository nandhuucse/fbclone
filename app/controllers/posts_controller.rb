class PostsController < ApplicationController
    def index
        @posts=Post.all.reverse
        if session[:user_id]
            @user=User.find_by(id: session[:user_id]) 
        end
        @user_list=User.all
        @ids=Post.all.ids
        
    end

    def like
        @post=Post.all.find(params[:id])
        
        if session[:user_id]
            @user=User.find_by(id: session[:user_id])
        end
        @like=@post.likes.find_by(user_id: @user.id)
        if !@like
            Like.create(user_id:@user.id,post_id:@post.id)
        else
            @like.destroy
        end
        redirect_to root_path(@post)
    end 


    def new
        @post=Post.new
        if session[:user_id]
            @user=User.find_by(id: session[:user_id]) 
        end
    end

    def create
        if session[:user_id]
            @user=User.find_by(id: session[:user_id]) 
        end

        params[:post][:user_id] = @user.id

        @post=Post.new(post_params)
        if @post.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    private

    def post_params
        params.require(:post).permit(:content, :user_id)
    end

end
