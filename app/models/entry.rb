class Entry < ApplicationRecord
  validates :date, uniqueness: true
  belongs_to :user
  belongs_to :category
end
