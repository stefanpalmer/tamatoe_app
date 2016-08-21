class Entry < ApplicationRecord
  validates :date, uniqueness: true
  belongs_to :user
end
