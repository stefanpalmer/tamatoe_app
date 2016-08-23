class Entry < ApplicationRecord
  validates :date, uniqueness: {scope: :user_id,
  message: 'Sorry, only one entry allowed per day'}
  belongs_to :user
  belongs_to :category

  has_attached_file :entry_img, :styles => { :entry_index => "150x250>", :entry_show => "225x375>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :entry_img, :content_type => /\Aimage\/.*\Z/
end
