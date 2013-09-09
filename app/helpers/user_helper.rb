helpers do

  def user_exists?(handle)
    return true if TwitterUser.find_by_handle(handle)
  end


  def create_user(handle)
    @user = Twitter.user(handle)
    TwitterUser.create(name: @user.name, handle: @user.handle.downcase, followers_count: @user.followers_count, twitter_birthday: @user.created_at)
  end

end
