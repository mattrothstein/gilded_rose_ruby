class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def update_quality
    decrement_sell_in
    decrement_quality
  end

  private

  def decrement_sell_in
    @sell_in -= 1
  end

  def decrement_quality
    return unless @quality > 0

    @quality -= 1
    @quality -= 1 if expired?
  end

  def expired?
    @sell_in < 0
  end
end
