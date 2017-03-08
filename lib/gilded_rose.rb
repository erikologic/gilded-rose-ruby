class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when "Aged Brie"
        item.quality += 1
        item.quality = 50 if item.quality > 50
        item.sell_in -= 1
      when 'Sulfuras, Hand of Ragnaros'
        # Nothing!
      when 'Backstage passes to a TAFKAL80ETC concert'
        delta = case
          when item.sell_in == 0
            -item.quality
          when item.sell_in <= 5
            3
          when item.sell_in <= 10
            2
          else
            1
          end

        item.quality += delta
        item.quality = 50 if item.quality > 50
        item.sell_in -= 1
      else
        delta = item.sell_in > 0 ? 1 : 2
        item.quality -= delta
        item.quality = 0 if item.quality < 0
        item.sell_in -= 1
      end

    end
  end
end
