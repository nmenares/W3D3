class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, presence: true, uniqueness: true
 
  def self.random_code
    #long_url, create short_url
    shorty = SecureRandom.urlsafe_base64
    
    until shorty.exists? == false
     shorty= SecureRandom.urlsafe_base64(16)
    end
    
    return shorty
      
  end  
  
  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User 
    
end
