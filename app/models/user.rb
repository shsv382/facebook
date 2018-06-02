class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, 
         :omniauth_providers => [:facebook, :vkontakte]

    def self.find_for_facebook_oauth access_token
    	if user = User.where(:name => access_token.extra.raw_info.name).first
    		user
    	else
    		User.create!(#provider: access_token.provider,
    			name: access_token.extra.raw_info.name,
    			email: 	  access_token.extra.raw_info.email,
    			password: Devise.friendly_token[0,20])
    	end
    end

    def self.find_for_vkontakte_oauth access_token
    	if user = User.where(:name => access_token.extra.raw_info.name).first
    		user
    	else
    		User.create!(#provider: access_token.provider,
    			name:  access_token.extra.raw_info.name,
    			email: access_token.extra.raw_info.name + '@vk.com',
    			password: Devise.friendly_token[0,20])
    	end
    end
	
end
