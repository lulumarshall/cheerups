module UsersHelper
  def gravatar_for(user)
    if user.image.present?
      image = user.image
    elsif 
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}.png?s=48"
    end
  end
end