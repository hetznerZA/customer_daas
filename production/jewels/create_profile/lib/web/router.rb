# Change to non-html RENDER
add_route('/create_profile',
"Create Profile with Customer Details") do |request|
  self.redirect_forbidden unless request.post?
  http_code, body = SoarSc::Web::Controllers::CreateProfile.new(@configuration).serve(request)
  SoarSc::Web::Views::Default.render(http_code, body) # json renderer
end
# 

