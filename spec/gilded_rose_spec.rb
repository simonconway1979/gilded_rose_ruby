require 'gilded_rose.rb'

describe GildedRose do

  describe "Adding tests to the original code" do

    context 'Checking the name does not change' do
      it "does not change the name" do
        item = Item.new("general_item", 10, 10)
        GildedRose.new(item).update_quality()
        expect(item.name).to eq "general_item"
      end
    end

    context 'For general item' do
      it 'should reduce the sell_in by 1 when greater than 0' do
        item = Item.new("general_item", 10, 10)
        GildedRose.new(item).update_quality()
        expect(item.sell_in).to eq 9
      end

      it 'should reduce the quality by 1 when greater than 0' do
        item = Item.new("general_item", 10, 10)
        GildedRose.new(item).update_quality()
        expect(item.quality).to eq 9
      end

      it 'should reduce the sell_in by 1 when the sell_in is less than 0' do
        item = Item.new("general_item", -1, 10)
        GildedRose.new(item).update_quality()
        expect(item.sell_in).to eq (-2)
      end

      it 'should reduce the quality by two when the sell_in is less than 0' do
        item = Item.new("general_item", -1, 10)
        GildedRose.new(item).update_quality()
        expect(item.quality).to eq 8
      end

      it 'should never reduce the quality to less than 0' do
        item = Item.new("general_item", -1, 0)
        GildedRose.new(item).update_quality()
        expect(item.quality).to eq 0
      end
    end

    context 'for Aged Brie' do
      it 'should reduce the sell_in by 1 when sell in is positive' do
        item = Item.new("Aged Brie", 10, 10)
        GildedRose.new(item).update_quality()
        expect(item.sell_in).to eq 9
      end

      it 'should increase the quality by 1 when sell in is positive' do
        item = Item.new("Aged Brie", 10, 10)
        GildedRose.new(item).update_quality()
        expect(item.quality).to eq 11
      end

      it 'should reduce the sell_in by 1 when sell_in is negative' do
        item = Item.new("Aged Brie", -1, 10)
        GildedRose.new(item).update_quality()
        expect(item.sell_in).to eq (-2)
      end

      it 'should increase the quality by 2 when sell_in is negative' do
        item = Item.new("Aged Brie", -1, 10)
        GildedRose.new(item).update_quality()
        expect(item.quality).to eq 12
      end

      it 'should never increase the quality to over 50' do
        item = Item.new("Aged Brie", 10, 50)
        GildedRose.new(item).update_quality()
        expect(item.sell_in).to eq (9)
        expect(item.quality).to eq 50
      end
    end

    context 'for Sulfuras, Hand of Ragnaros' do
      it 'should not increase or decrease the sell_in' do
        item = Item.new("Sulfuras, Hand of Ragnaros", 10, 10)
        GildedRose.new(item).update_quality()
        expect(item.sell_in).to eq 10
      end


    end

    context 'Backstage passes' do
      it 'should decrease sell_in by 1 when sell_in is greater than 10' do
        item = Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 10)
        GildedRose.new(item).update_quality()
        expect(item.sell_in).to eq 10
      end

      it 'should increase in quality by 1 when sell_in is greater than 10' do
        item = Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 10)
        GildedRose.new(item).update_quality()
        expect(item.quality).to eq 11
      end

      it 'should decrease sell_in by 1 when sell_in is between 5 and 10' do
        item = Item.new("Backstage passes to a TAFKAL80ETC concert", 7, 10)
        GildedRose.new(item).update_quality()
        expect(item.sell_in).to eq 6
      end

      it 'should increase in quality by 2 when sell_in is between 5 and 10' do
        item = Item.new("Backstage passes to a TAFKAL80ETC concert", 7, 10)
        GildedRose.new(item).update_quality()
        expect(item.quality).to eq 12
      end

      it 'should decrease sell_in by 1 when sell_in is between 1 and 5' do
        item = Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 10)
        GildedRose.new(item).update_quality()
        expect(item.sell_in).to eq 0
      end

      it 'should increase in quality by 3 when sell_in is between 1 and 5' do
        item = Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 10)
        GildedRose.new(item).update_quality()
        expect(item.quality).to eq 13
      end

      it 'should set quality to 0 when sell_in is 0' do
        item = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)
        GildedRose.new(item).update_quality()
        expect(item.quality).to eq 0
      end
    end


  end
end
