
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # this redirects homepage url to /articles url
  # which shows index.erb view file
  get '/' do
    redirect :'/articles'
  end

  # shows index.erb view file; lists all articles' titles
  get '/articles' do
    @articles = Article.all

    erb :index
  end

  get '/articles/new' do
    #@article = Article.new
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    redirect :"/articles/#{ @article.id }"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  #update
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  #destroy
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end

end
