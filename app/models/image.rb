class Image < ApplicationRecord
	has_attached_file :image
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
#    attr_accessor :image_file_name

    belongs_to :user
end
