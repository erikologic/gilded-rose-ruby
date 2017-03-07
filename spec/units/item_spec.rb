describe Item do
  subject (:item) {described_class.new('foo',5,5)}
  it {is_expected.to respond_to(:sell_in)}
end
