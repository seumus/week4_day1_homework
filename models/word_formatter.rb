# require('sinatra/contrib/all') if development?

class WordFormatter

  attr_accessor(:address)

  def initialize(address)
    @address = address
  end

  def postcode_upcase()
    @address[:postcode] = @address[:postcode].upcase
    return @address
  end

  def camelcase()
    @address[:address] = @address[:address].split(' ').collect(&:capitalize).join
    @address[:building] = @address[:building].split(' ').collect(&:capitalize).join
    return @address
  end
end
