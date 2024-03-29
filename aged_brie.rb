require './better_with_age.rb'

class AgedBrie < Item
  include BetterWithAge

  def update_quality
    decrement_sell_in
    increment_quality
    increment_quality if expired?
  end
end
