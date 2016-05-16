require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('./models/about_me.rb')
require_relative('./models/word_formatter.rb')
require('json')


get '/' do
  erb :about_me
end

get '/address' do
  content_type(:json)
  result = WordFormatter.new({address: '3 ARGYLE HOUSE',
            building: 'CODEBASE',
            postcode: 'e13 zqf',
            phone: '0131558030'}).postcode_upcase
  return result.to_json
end

get '/:string' do
  return params[:string].camelize
end
