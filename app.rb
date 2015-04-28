require 'open-uri'
require 'json'

get '/' do
  redirect '/index.html'
end

get '/image' do
  image_url = params[:url]
  file = open(image_url)
  content_type file.content_type
  file
end

get '/config.json' do
  content_type 'application/json'
  path = 'public/config.json'
  if File.exist?(path)
    File.read(path)
  else
    {rssServiceUrl: ENV['RSS_SERVICE_URL']}.to_json
  end
end
