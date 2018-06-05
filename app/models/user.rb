class User < ApplicationRecord


    has_attached_file :avatar, :styles => {medium: "300x300", thumb: "100x100"}
    validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, 
         :omniauth_providers => [:facebook, :vkontakte]

    def self.find_for_facebook_oauth access_token
    	if user = User.where(:email => access_token.extra.raw_info.email).first
    		user
    	else
    		User.create!(#provider: access_token.provider,
    			name: access_token.extra.raw_info.name,
    			email: 	  access_token.extra.raw_info.email,
    			password: Devise.friendly_token[0,20])
    	end
    end

    def self.find_for_vkontakte_oauth access_token
    	if user = User.where(:name => access_token.info.name).first
    		user
    	else
    		user = User.create!(#provider: access_token.provider,
    			name:  access_token.info.name,
    			email: access_token.info.name.split[0] + rand(265536).to_s + '@vk.com',
    			password: Devise.friendly_token[0,20])
    	end
    end
	
end
