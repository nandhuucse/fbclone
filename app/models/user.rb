# name: string
# email: string
# password_digest:string
# 
# password: string=>virtual
# password_confirmation:string=>virtual


class User < ApplicationRecord
    has_secure_password
    validates :email, presence:true
    has_many :posts
    has_many :comments

    # has_many :follows

    has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
    has_many :followers, through: :follower_relationships, source: :follower

    has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followings, through: :following_relationships, source: :following

    def followed_by?(user)
        !!self.followers.find{|profile| profile.id==user.id}
    end
end
