# Homepage (Root path)
helpers do
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  erb :index
end

get '/resources' do
  @resources = Resource.all
  erb :'resources/index'
end

get '/resources/new' do
  @resource = Resource.new
  erb :'resources/new'
end

post '/resources' do
  @resource = Resource.new(params)
  @resource.user = current_user #adds this to the hash
  if @resource.save
    redirect '/resources'
  else
    erb :'resources/new'
  end
end

get '/resources/:id' do
  @resource = Resource.find params[:id]
  @resources = Resource.all
  @reviews = @resource.reviews
  # @review = Review.new
    erb :'resources/show'
  end

# get 'resources/:review_id' do
#   @review = Review.find params[:id]
#   @reviews = Review.all
#   @reviews= @resource.reviews
#   erb :'resources/show'
# end

post '/resources/:id' do 
  resource = Resource.find_by(
    user_id: current_user.id,
    id: params[:id]
    )
  if resource
    resource.destroy
    redirect '/resources'
  else 
    redirect '/'
  end
end


post '/resources/upvote/:resource_id' do
  upvote = Upvote.create(
    resource_id: params[:resource_id],
    user_id: current_user.id
    )
  redirect '/resources/' + params[:resource_id]
end

post '/resources/downvote/:resource_id' do
  Downvote.create(
    resource_id: params[:resource_id],
    user_id: current_user.id
    )
  redirect '/resources/' + params[:resource_id]
end

post '/resources/:resource_id/review' do
  @review = Review.create(
    resource_id: params[:resource_id],
    user_id: current_user.id,
    review_text: params[:review_text]
    )
    redirect 'resources/' + params[:resource_id]
  end

# post '/resources/:resource_id/:review_id/like' do
#   @like = Like.create(
#     resource_id: params[:resource_id]
#     review_id: params[:review_id],
#     user_id: current_user.id,
#     likes_counter: params[:likes_counter]
#     )
# redirect 'resources/' 
#   end

  # action="/resources/<%= @resource.id %>/<%= @review.id %>/likes">
#Authentication Actions

get '/sign_up' do
  erb :'auth/sign_up'
end

post '/sign_up' do
  @user = User.new(
    email: params[:email],
    password: params[:password]
    )

  if @user.save
     session[:user_id] = @user.id
     redirect '/'
  else
    erb :'auth/signup'
  end
end

get '/log_in' do
  erb :'auth/log_in'
end

post '/log_in' do
  @user = User.find_by(
    email: params[:email],
    password: params[:password]
    )
  if @user 
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'auth/log_in'
  end
end

post '/log_out' do

  session[:user_id] = nil
  redirect '/'
end