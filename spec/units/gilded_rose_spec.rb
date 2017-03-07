describe GildedRose do
  let(:item_foo) { double :item, name: 'foo', quality: 5, sell_in: 5 }
  subject (:gilded_rose) { described_class.new( [item_foo] ) }

  before do
    allow(item_foo).to receive(:sell_in=)
    allow(item_foo).to receive(:quality=)
  end

  describe "#update_quality" do
    it "lower the sell_in value" do
      gilded_rose.update_quality
      expect(item_foo).to have_received(:sell_in=).with(4)
    end
  end

end
