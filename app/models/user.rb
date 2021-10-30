class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  #validates :password, presence: true

  has_many :rides
  has_many :attractions, through: :rides


  def mood
    if self.happiness == nil || self.nausea == nil
      @mood = ''
    elsif self.happiness > self.nausea
      @mood = 'happy'
    else
      @mood = 'sad'
    end
  end
end
