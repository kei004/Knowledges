require 'test_helper'

class TableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should be vaild" do
    @table = Table.new(atter:"1",title:"First table", contents:"This is my first new table",tag:"Firtsttable",rule:"all")
  end
end
