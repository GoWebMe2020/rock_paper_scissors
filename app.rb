require 'sinatra'
require 'sinatra/reloader' if development?

class Rps < Sinatra::Base
    configure :development do
        register Sinatra::Reloader
    end

    enable :sessions

    get '/' do
        erb :index
    end

    post '/name' do
        $name = params[:name] #session[:name]
        redirect '/play'
    end

    get '/play' do
        @name = $name
        erb :play
    end

end