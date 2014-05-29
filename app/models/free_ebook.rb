class FreeEbook < ActiveRecord::Base
  belongs_to :user
  has_attached_file :photo,
  			:url => "/assets/free_ebooks/:id/:style/:basename.:extension",
  			:path => ":rails_root/public/assets/free_ebooks/:id/:style/:basename.:extension"
  validates_attachment :photo,
  :content_type => { :content_type => "image/jpg" },
  :size => { :in => 0..1000.kilobytes }
end
