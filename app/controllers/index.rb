get '/' do
  erb :index
end

get '/tweets/:handle' do
  @user = TwitterUser.find_by_handle(params[:handle])
  @user_timeline = @user.tweets.all.reverse
  erb :timeline
end

post '/tweets' do
  @handle = params[:handle].downcase
  if user_exists?(@handle)
    @user = TwitterUser.find_by_handle(@handle)
    unless @user.tweets_stale?
      redirect "/tweets/#{@handle}"
    end
  else
    @user = create_user(@handle)
  end

  @user.fetch_tweets!

  redirect to "/tweets/#{@handle}"
end
