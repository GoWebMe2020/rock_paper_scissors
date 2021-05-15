require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/play'
require './lib/machine_choice'

class Rps < Sinatra::Base
    configure :development do
        register Sinatra::Reloader
    end

    enable :sessions

    get '/' do
        erb :index
    end

    post '/name' do
        session[:name] = params[:name]
        redirect '/play'
    end

    get '/play' do
        @play = Play.new(session)
        # session[:machine_choice] = @play.machine_choice
        erb :play
    end

    post '/play' do
        session[:choice] = params[:choice].downcase.to_sym
        session[:machine_choice] = MachineChoice.new.machine_choice.to_sym
        redirect '/play'
    end

    post '/restart' do
        session[:choice] = nil
        session[:name] = nil
        session[:machine_choice] = nil
        redirect '/'
    end

    run! if app_file == $0
end