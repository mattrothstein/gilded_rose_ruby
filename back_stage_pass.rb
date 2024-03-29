require './better_with_age.rb'

class BackStagePass < Item
  include BetterWithAge

  def update_quality
    increment_quality
    increment_quality if @sell_in < 11
    increment_quality if @sell_in < 6

    decrement_sell_in

    reset_quality if expired?
  end

  private

  def reset_quality
    @quality = 0
  end
end
