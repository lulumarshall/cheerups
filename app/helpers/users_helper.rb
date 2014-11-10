module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    # if user.avatar_url.present?
    #   user.avatar_url
    # else
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}.png?s=48"
      # image_tag(gravatar_url, alt: user.username, class: "gravatar")
    # end
  end
end