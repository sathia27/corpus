class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :confirmable, :omniauthable
  has_many :words

    def self.find_for_oauth(auth)
      record = where(provider: auth.provider, uid: auth.uid.to_s).first
      puts "!"*10
      if record.blank?
        email = auth.info.email
        unless email.blank?
          email_found = where(email: email).last
          if email_found
            email_found.update_attributes({uid: auth.uid, provider: auth.provider})
            record = email_found
          end
        end
      end
      record || create(provider: auth.provider, uid: auth.uid, email: auth.info.email, password: Devise.friendly_token[0,20], name: auth.info.name)
    end
    
    def to_s
      name.blank? ? email : name
    end
    
    def image
      if provider and provider.eql?("facebook")
        "http://graph.facebook.com/" + uid + "/picture"
      else
        require 'digest/md5'
        hash = Digest::MD5.hexdigest(email.downcase)
        "http://www.gravatar.com/avatar/#{hash}"
      end
    end

    protected
    def confirmation_required?
      false
      #true if provider.blank? || uid.blank?
    end
end
