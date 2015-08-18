class User < ActiveRecord::Base
  has_many :songs
  has_many :upvotes

  validates_presence_of :email, :user_name, :password
  validates_uniqueness_of :email, :user_name

  def upvotes_received
    @count = 0
    self.songs.each do |song|
      @count += song.upvotes.count
    end
    @count
  end

end