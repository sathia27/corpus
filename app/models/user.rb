class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :validatable, :confirmable, :omniauthable
  has_many :words
  has_many :social_connects

  def self.find_for_oauth(auth)
    connect = SocialConnect.where(provider: auth.provider, uid: auth.uid.to_s).first
    email = auth.info.email
    return if email.blank?
    user = where(email: email).last
    user = User.create(email: auth.info.email, name: auth.info.name, password: Devise.friendly_token[0,20]) if user.blank?
    SocialConnect.create(provider: auth.provider, uid: auth.uid, user_id: user.id) if connect.blank?
    user.update_attributes(:name => auth.info.name) if user and user.name.blank? and auth.info.name.present?
    user
  end

  def to_s
    name.blank? ? email : name
  end

  def image
    fb_profile = social_connects.where(:provider => "facebook")
    if fb_profile.any?
      "http://graph.facebook.com/" + fb_profile.last.uid + "/picture"
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
