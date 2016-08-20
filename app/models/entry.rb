class Entry < ApplicationRecord
  validates :date, uniqueness: true
end
