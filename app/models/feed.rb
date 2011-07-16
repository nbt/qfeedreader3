require 'feedzirra'

class Feed < ActiveRecord::Base
  has_many :posts

  after_create :fetch

  def fetch
    return unless (feed = Feedzirra::Feed.fetch_and_parse(url))
    
    transaction do
      self.title = feed.title
      self.updated_at = Time.now
      save!
      
      feed.entries[0, 3].each do |entry|
        unless posts.find_by_url(entry.url)
          posts.create! :title => entry.title, :url => entry.url
        end
      end
    end
  end
  handle_asynchronously :fetch  # process fetch as a delayed_job task
  
end

# == Schema Information
#
# Table name: feeds
#
#  id         :integer         not null, primary key
#  url        :string(255)
#  title      :string(255)     default("(pending)")
#  created_at :datetime
#  updated_at :datetime
#

