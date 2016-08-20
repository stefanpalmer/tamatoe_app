require 'rails_helper'

RSpec.describe Entry, type: :model do
  it { is_expected.to validate_uniqueness_of(:date)#.scoped_to(:user_id) }
  }
end
