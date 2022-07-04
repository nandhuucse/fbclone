class ProfileController < ApplicationController
    def index
        if session[:user_id]
            @user=User.find_by(id: session[:user_id])
        end
    end
    def userProfile
        if session[:user_id]
            @user=User.find_by(id: session[:user_id])
        end
        @userprofile=User.find(params[:id])
        @user_list=User.all
    end
    def follow
        if session[:user_id]
            @user=User.find_by(id: session[:user_id])
        end
        # binding.pry
        @userprofile=User.find(params[:id])
        @follow=Follow.find_by(follower: @user, following: @userprofile)
        if !@follow
            Follow.create(follower:@user,following:@userprofile)
        else
            @follow.destroy
        end
        respond_to do |format|
            format.js {render inline: "location.reload();" }
        end
    end
end