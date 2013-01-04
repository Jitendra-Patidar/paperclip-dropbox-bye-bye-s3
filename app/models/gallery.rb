class Gallery < ActiveRecord::Base
  attr_accessible :name, :image
  #has_attached_file :image, :styles => { :small => "150x150>" },
  #                :url  => "/assets/products/:id/:style/:basename.:extension",
  #                :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
                  
   has_attached_file :image,
    :storage => :dropbox,
    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
    #:dropbox_credentials => {
    #             app_key: ENV["DROPBOX_APP_KEY"],
    #             app_secret: ENV["DROPBOX_APP_SECRET"],
    #             access_token: ENV["DROPBOX_ACCESS_TOKEN"],
    #             access_token_secret: ENV["DROPBOX_ACCESS_TOKEN_SECRET"],
    #             user_id: ENV["DROPBOX_USER_ID"]
    #           },
    :styles => { :medium => "300x300" },
    :dropbox_options => {
      :path => proc { |style| "#{style}/#{id}_#{image.original_filename}" }
    }                

end
