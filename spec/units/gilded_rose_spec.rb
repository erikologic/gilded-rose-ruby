ItemStruct = Struct.new(:name, :quality, :sell_in)

describe GildedRose do
  let(:item) { ItemStruct.new('foo', 5, 5) }
  subject (:gilded_rose) { described_class.new( [item] ) }

  describe "#update_quality" do
    xit "lower the sell_in value" do
      gilded_rose.update_quality
      expect(item.sell_in).to eq(4)
    end

    xit "lower the quality value" do
      gilded_rose.update_quality
      expect(item.quality).to eq(4)
    end
    xcontext "when quality value is 0" do
      it "cannot become negative" do
        item.quality = 0
        gilded_rose.update_quality
        expect(item.quality).to eq(0)
      end
    end
    xcontext "when quality value is 50" do
      it "cannot go above 50" do
        item.name = 'Aged Brie'
        item.quality = 50
        gilded_rose.update_quality
        expect(item.quality).to eq(50)
      end
    end
    xcontext "when item.sell_in == 0" do
      it "degrades twice as faster" do
        item.sell_in = 0
        gilded_rose.update_quality
        expect(item.quality).to eq(3)
      end
    end
    xcontext "when item.name == 'Aged Brie'" do
      it 'increases in quality' do
        item.name = 'Aged Brie'
        gilded_rose.update_quality
        expect(item.quality).to eq(6)
      end
    end
    xcontext "when item.name == 'Sulfuras, Hand of Ragnaros'" do
      it 'do not change quality' do
        item.name = 'Sulfuras, Hand of Ragnaros'
        gilded_rose.update_quality
        expect(item.quality).to eq(5)
        expect(item.sell_in).to eq(5)
      end
    end
    xcontext "when item.name == 'Backstage passes to a TAFKAL80ETC concert'" do
      context "when 5 < sell_in <= 10" do
        it 'quality increases by 2' do
          item.name = 'Backstage passes to a TAFKAL80ETC concert'
          item.sell_in = 10
          quality = item.quality
          5.times { gilded_rose.update_quality }
          expect(item.quality).to eq(quality + 5 * 2)
        end
      end
      context "when 0 < sell_in <= 5" do
        it 'quality increases by 3' do
          item.name = 'Backstage passes to a TAFKAL80ETC concert'
          item.sell_in = 5
          quality = item.quality
          5.times { gilded_rose.update_quality }
          expect(item.quality).to eq(quality + 5 * 3)
        end
      end
      context "when sell_in <= 0" do
        it 'quality is 0' do
          item.name = 'Backstage passes to a TAFKAL80ETC concert'
          item.sell_in = 0
          gilded_rose.update_quality
          expect(item.quality).to eq(0)
        end
      end
    end
    xcontext "when item.name == 'Conjured'" do
      it 'degrades quality and sell_in twice as faster' do
        item.name = 'Conjured'
        gilded_rose.update_quality
        expect(item.quality).to eq(3)
        expect(item.sell_in).to eq(3)
      end
    end
  end

end
