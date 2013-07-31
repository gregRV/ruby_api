get '/' do
  erb :index
end

get '/handle' do
	# client only works as an instance var?
	@client = Tumblr::Client.new
	# :type refers to the type of blog post
	@type = params[:type]
	@content = @client.posts(params[:handle], :type => params[:type], :limit => 3)
	# 'posts' saved as an array
	@posts = @content['posts']
  erb :show_user
end