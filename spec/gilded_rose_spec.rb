require 'gilded_rose.rb'

describe GildedRose do

  describe "Adding tests to the original code" do

    context 'Checking the name does not change' do
      it "does not change the name" do
        items = [Item.new("foo", 0, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].name).to eq "foo"
      end
    end

    context 'For general items' do
      it 'should reduce the sell_in and quality by 1 when greater than 0' do
        items = [Item.new("general_item", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
        expect(items[0].quality).to eq 9
      end

      it 'should reduce the sell_in by 1 and the quality by two when the sell_in is less than 0' do
        items = [Item.new("general_item", -1, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq (-2)
        expect(items[0].quality).to eq 8
      end

      it 'should never reduce the quality to less than 0' do
        items = [Item.new("general_item", -1, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq (-2)
        expect(items[0].quality).to eq 0
      end

    end

    context 'for Aged Brie' do
      it 'should reduce the sell_in by 1 and increase the quality by 1 when sell in is positive' do
        items = [Item.new("Aged Brie", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
        expect(items[0].quality).to eq 11
      end

      it 'should reduce the sell_in by 1 and increase teh quality by 2 when sell_in is negative' do
        items = [Item.new("Aged Brie", -1, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq (-2)
        expect(items[0].quality).to eq 12
      end

      it 'should never increase the quality to over 50' do
        items = [Item.new("Aged Brie", 10, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq (9)
        expect(items[0].quality).to eq 50
      end
    end

    context 'for Sulfuras, Hand of Ragnaros' do
      it 'should not increase or decrease the sell_in or quality' do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 10
        expect(items[0].quality).to eq 10
      end
    end

    context 'Backstage passes' do
      it 'should increase in quality by 1 when sell_in is greater than 10' do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 10
        expect(items[0].quality).to eq 11
      end
    end


  end
end
