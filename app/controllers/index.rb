

get '/' do
  @remind_us_about_erb = "this is our reminder"
  @some_list_of_things = [1,2,3,4,5]
  @categories = Category.all
  erb :index
end

get '/category/:id' do
  @category = Category.where('id = ?', params[:id]).first
  erb :category
end

post '/posts/' do
# redirect to the page of the post
  @params = params
  @key = SecureRandom.hex(99)
  @params[:secret_key] = @key
  @post = Post.create(@params)

  redirect to("/post/#{@post.secret_key.to_s}/edit")
  # params[:name]
  # params[:description]
  # erb :post
end

get "/post/:id" do
  @post = Post.where('id = ?', params[:id]).first
  erb :post
end


get "/post/:secret_key/edit" do
  @categories = Category.all
  @post = Post.where('secret_key = ?', params[:secret_key]).first
  erb :edit
end

post "/post/edit" do
  @post = Post.find(params['id'])
  @post.update_attributes params
  redirect to("/post/#{@post.id.to_s}")
end  

post "/post/delete" do
  @post = Post.find(params['id'])
  @post.destroy
  redirect to("/")
end


# Sinatra's get, post, put, etc. URL helpers match against the shape/form of a URL.
# That is,
#
#   get '/:word' do
#     ...
#   end
#
# means "call this block any time we see a URL that looks like /<word>"
#
# The parts of a URL are separated by a /, so these match '/:word'
#
#   /foo, /bar, /apple+pie, /four+score+and+seven+years+ago
#
# whereas these do not match '/:word'
#
#   /, /word1/word2, /this/is/a/long/url, /articles/123
#
# This will bind whatever fits in the :word spot in the URL
# to params[:word], "as if" it were passed in via a query string
# like ?word=apples


# get '/menu_items/:id/edit' do
#   @item = MenuItem.find params[:id]
#   @items = MenuItem.all
#   erb :index
# end
