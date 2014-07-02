module TeamsHelper
	def gravatar_for(team)
    gravatar_id = Digest::MD5::hexdigest('user@example.com')
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: team.name, class: "gravatar")
  end
end
