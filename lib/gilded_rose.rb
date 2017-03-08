class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

      if item.name == "Aged Brie"
        item.quality += 1
        item.quality = 50 if item.quality > 50
        item.sell_in -= 1
      elsif item.name == 'Sulfuras, Hand of Ragnaros'
        # Nothing!
      elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
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
      # if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
      #   if item.quality > 0
      #     if item.name != "Sulfuras, Hand of Ragnaros"
      #       item.quality = item.quality - 1
      #     end
      #   end
      # else
      #   if item.quality < 50
      #     item.quality = item.quality + 1
      #     if item.name == "Backstage passes to a TAFKAL80ETC concert"
      #       if item.sell_in < 11
      #         if item.quality < 50
      #           item.quality = item.quality + 1
      #         end
      #       end
      #       if item.sell_in < 6
      #         if item.quality < 50
      #           item.quality = item.quality + 1
      #         end
      #       end
      #     end
      #   end
      # end
      # if item.name != "Sulfuras, Hand of Ragnaros"
      #   item.sell_in = item.sell_in - 1
      # end
      # if item.sell_in < 0
      #   if item.name != "Aged Brie"
      #     if item.name != "Backstage passes to a TAFKAL80ETC concert"
      #       if item.quality > 0
      #         if item.name != "Sulfuras, Hand of Ragnaros"
      #           item.quality = item.quality - 1
      #         end
      #       end
      #     else
      #       item.quality = item.quality - item.quality
      #     end
      #   else
      #     if item.quality < 50
      #       item.quality = item.quality + 1
      #     end
      #   end
      # end
    end
  end
end
