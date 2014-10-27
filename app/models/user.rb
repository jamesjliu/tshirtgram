class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_attached_file :profile_picture, :styles => { :medium => "300x300#", :thumb => "100x100#" },
  :default_url => "/images/:style/missingprofilepicture.png"
  validates_attachment_content_type :profile_picture, :content_type => /\Aimage\/.*\Z/
  
  has_many :sales
  has_many :pictures
  
end
