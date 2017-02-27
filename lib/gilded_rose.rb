

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
  end

class GildedRose

  attr_reader :item

  def initialize(item)
    @item = item_klass(item).new(item)
  end

  def item_klass(item)
    case
    when item.name == "general_item"
      Normal
    when item.name == "Aged Brie"
      Brie
    when item.name == "Sulfuras, Hand of Ragnaros"
      Sulfuras
    when item.name == "Backstage passes to a TAFKAL80ETC concert"
      BackstagePass
    end
  end

  def update_quality
    @item.update
  end

  def name
    @item.name
  end

  def quality
    @item.quality
  end

  def sell_in
    @item.sell_in
  end


end


class ItemHolder

  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update
  end

end

class Normal < ItemHolder

  def update
    item.sell_in -= 1
    return if item.quality == 0
    item.quality -= 1
    item.quality -= 1 if item.sell_in <= 0
  end
end

class Brie < ItemHolder

  def update
    item.sell_in -= 1
    return if item.quality >= 50
    item.quality += 1
    item.quality += 1 if item.sell_in <=0
  end
end

class Sulfuras < ItemHolder
end

class BackstagePass < ItemHolder

  def update
    item.sell_in -= 1
    return if item.quality >= 50
    return item.quality = 0 if item.sell_in < 0
    item.quality += 1
    item.quality += 1 if item.sell_in < 10
    item.quality += 1 if item.sell_in < 5
  end
end


# require 'pry'; binding.pry
