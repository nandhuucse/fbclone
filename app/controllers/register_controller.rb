class RegisterController < ApplicationController
    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        if @user.save
            session[:user_id]=@user.id
            redirect_to signin_path, notice:"successfully created account"
        else
            flash[:alert]='something went wrong'
            render :new
        end
    end

    def edit
        @user=User.find(params[:id])
    end

    def update
        @user=User.find(params[:id])
        # binding.pry
        if  @user.update(user_params)
            redirect_to profile_path
        else
            render "edit"
        end
    end

    private
    def user_params
        params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end