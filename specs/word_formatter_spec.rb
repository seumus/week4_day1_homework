# require('sinatra/contrib/all') if development?
require('minitest/autorun')
require_relative('../models/word_formatter.rb')

class TestWordFormatter < Minitest::Test

  def setup()
    @address = WordFormatter.new({address: '3 ARGYLE HOUSE',
               building: 'CODEBASE',
               postcode: 'e13 zqf',
               phone: '0131558030'})
  end

  def test_postcode_upcase()
    result = @address.postcode_upcase()
    assert_equal({address: '3 ARGYLE HOUSE',
               building: 'CODEBASE',
               postcode: 'E13 ZQF',
               phone: '0131558030'}, result)
  end

  def test_camelcase()
    result = @address.camelcase()
    assert_equal({:address=>"3ArgyleHouse",
                  :building=>"Codebase",
                  :postcode=>"e13 zqf",
                  :phone=>"0131558030"}, result)
  end

end
