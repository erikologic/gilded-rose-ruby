ItemStruct = Struct.new(:name, :quality, :sell_in)

describe GildedRose do
  let(:item) { ItemStruct.new('foo', 5, 5) }
  subject (:gilded_rose) { described_class.new( [item] ) }

  describe "#update_quality" do
    it "lower the sell_in value" do
      gilded_rose.update_quality
      expect(item.sell_in).to eq(4)
    end

    it "lower the quality value" do
      gilded_rose.update_quality
      expect(item.quality).to eq(4)
    end
    context "when quality value is 0" do
      it "cannot become negative" do
        item.quality = 0
        gilded_rose.update_quality
        expect(item.quality).to eq(0)
      end
    end
    xcontext "when quality value is 50" do
      it "cannot go above 50" do
        item.quality = 50
        gilded_rose.update_quality
        expect(item.quality).to eq(50)
      end
    end
    context "when item.sell_in == 0" do
      it "degrades twice as faster" do
        item.sell_in = 0
        gilded_rose.update_quality
        expect(item.quality).to eq(3)
      end
    end
    context "when item.name == 'Aged Brie'" do
      it 'increases in quality' do
        item.name = 'Aged Brie'
        gilded_rose.update_quality
        expect(item.quality).to eq(6)
      end
    end
  end

end
