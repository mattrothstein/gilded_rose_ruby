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
    if name != "Aged Brie" and name != "Backstage passes to a TAFKAL80ETC concert"
      if quality > 0
        if name != "Sulfuras, Hand of Ragnaros"
          self.quality = quality - 1
        end
      end
    else
      if quality < 50
        self.quality = quality + 1
        if name == "Backstage passes to a TAFKAL80ETC concert"
          if sell_in < 11
            if quality < 50
              self.quality = quality + 1
            end
          end
          if sell_in < 6
            if quality < 50
              self.quality = quality + 1
            end
          end
        end
      end
    end
    if name != "Sulfuras, Hand of Ragnaros"
      self.sell_in = sell_in - 1
    end
    if sell_in < 0
      if name != "Aged Brie"
        if name != "Backstage passes to a TAFKAL80ETC concert"
          if quality > 0
            if name != "Sulfuras, Hand of Ragnaros"
              self.quality = quality - 1
            end
          end
        else
          self.quality = quality - quality
        end
      else
        if quality < 50
          self.quality = quality + 1
        end
      end
    end
  end
end
