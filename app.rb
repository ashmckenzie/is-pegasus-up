require 'sinatra'
require 'sinatra/respond_to'

require './lib/support'
require './lib/pegasus_status'
require './lib/pegasus_status_presenter'

class App < Sinatra::Base

  register Sinatra::RespondTo

  configure :development do
    register Sinatra::Reloader
    also_reload Dir.pwd + '/lib/*.rb'
  end

  get '/status' do
    @refresh = params[:refresh] == 'true'
    @status = PegasusStatus.new.check!

    respond_to do |wants|
      wants.html { erb :status }
      wants.json { erb :status }
    end
  end
end
