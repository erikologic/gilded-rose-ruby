describe GildedRose do
  let(:item) { double :item, name: 'foo', quality: 5, sell_in: 5 }
  subject (:gilded_rose) { described_class.new( [item] ) }

  before do
    allow(item).to receive(:sell_in=)
    allow(item).to receive(:quality=)
  end

  describe "#update_quality" do
    it "lower the sell_in value" do
      gilded_rose.update_quality
      expect(item).to have_received(:sell_in=).with(4)
    end

    it "lower the quality value" do
      gilded_rose.update_quality
      expect(item).to have_received(:quality=).with(4)
    end
    context "when quality value is 0" do
      it "cannot become negative" do
        item.quality = 0
        gilded_rose.update_quality
        expect(item).to have_received(:quality=).with(0)
      end
    end
    xcontext "when quality value is 50" do
      it "cannot go above 50" do
        item.quality = 50
        gilded_rose.update_quality
        expect(item).to have_received(:quality=).with(50)
      end
    end
  end

end
