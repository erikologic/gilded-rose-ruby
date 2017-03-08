class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when "Aged Brie"
        delta_quality = 1
        delta_sell_in = -1
      when 'Sulfuras, Hand of Ragnaros'
        delta_quality = 0
        delta_sell_in = 0
      when 'Backstage passes to a TAFKAL80ETC concert'
        delta_quality = case
          when item.sell_in == 0
            -item.quality
          when item.sell_in <= 5
            3
          when item.sell_in <= 10
            2
          else
            1
          end

        delta_sell_in = -1
      else
        delta_quality = item.sell_in > 0 ? -1 : -2
        delta_sell_in = -1
      end

      item.quality += delta_quality
      item.quality = 0 if item.quality < 0
      item.quality = 50 if item.quality > 50

      item.sell_in += delta_sell_in
    end
  end
end
