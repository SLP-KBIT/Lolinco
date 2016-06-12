require 'sinatra'
require 'sinatra/asset_pipeline'
require 'sinatra/reloader' if development?

require 'slim'
require 'sass'
require 'coffee-script'

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

