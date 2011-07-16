class Post < ActiveRecord::Base
  belongs_to :feed
end

# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  feed_id    :integer
#  title      :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

