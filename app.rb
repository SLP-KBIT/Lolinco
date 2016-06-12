require 'sinatra'
require 'sinatra/asset_pipeline'
require 'sinatra/reloader' if development?

require 'slim'
require 'sass'
require 'coffee-script'

require 'base64'

Dir[File.dirname(__FILE__) + '/models/**/*.rb'].each { |f| require f }

set :root, File.dirname(__FILE__)
set :assets_precompile, %w(application.js application.css
                           *.png *.jpg *.svg
                           *.eot *.ttf *.woff)
set :assets_css_compressor, :sass
set :assets_js_compressor, :uglifier
register Sinatra::AssetPipeline

get '/' do
  slim :index
end

post '/' do
  if params[:image]
    `rm ./public/*.jpg`
    File.write('./public/image.jpg', params[:image][:tempfile].read)
    path_list = `python extract_face.py ./public/image.jpg`.chomp.split(',')
    loli_list = []
    path_list.each do |path|
      `convert -geometry 128x128 #{path} #{path}`
    end
    # path_list.each do |path|
    #   status = `python judge_loli.py #{path}`.to_i
    #   loli_list << status == 1 ? true : false
    # end
    # @is_loli = loli_list.any?
    @image_list = path_list.map { |path| Base64.encode64(File.read(path)) }
    p @image_list
  end
  slim :index
end

