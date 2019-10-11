require "sinatra"
require "sinatra/reloader" if development?

get "/" do
  haml :index
end

get "/gardening" do
  haml :gardening
end
get "/work" do
  haml :work
end
get "/resume" do
  @files = Dir.glob("./files/*.*").map{|f| f.split('/').last}
  haml :resume
end

get '/download/:filename' do |filename|
  send_file "./files/#{filename}", :filename => filename, :type => 'Application/pdf', :disposition => 'inline'
end
