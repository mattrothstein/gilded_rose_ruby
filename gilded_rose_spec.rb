require 'rspec'

require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  subject { GildedRose.new([item]) }

  describe '.update_quality' do
    before(:each) do
      subject.update_quality()
    end

    context 'item is Basic Item' do
      let(:item) { Item.new("Basic Item", 10, 20) }

      it "does not change the name" do
        expect(item.name).to eq "Basic Item"
      end

      it "decrements sell_in" do
        expect(item.sell_in).to eq 9
      end

      it "decrements quality" do
        expect(item.quality).to eq 19
      end
    end

    context 'item is Aged Brie' do
      let(:item) { Item.new("Aged Brie", 10, 20) }

      it "does not change the name" do
        expect(item.name).to eq "Aged Brie"
      end

      it "decrements sell_in" do
        expect(item.sell_in).to eq 9
      end

      it "increments quality" do
        expect(item.quality).to eq 21
      end

      context 'quality is at 50' do
        let(:item) { Item.new("Aged Brie", 10, 50) }

        it " does not increments quality" do
          expect(item.quality).to eq 50
        end
      end
    end

    context 'item is Sulfuras, Hand of Ragnaros' do
      let(:item) { Item.new("Sulfuras, Hand of Ragnaros", 0, 80) }

      it "does not change the name" do
        expect(item.name).to eq "Sulfuras, Hand of Ragnaros"
      end

      it "does not decrement sell_in" do
        expect(item.sell_in).to eq 0
      end

      it "does not increment quality" do
        expect(item.quality).to eq 80
      end
    end

    context 'item is Backstage passes to a TAFKAL80ETC concert' do
      let(:item) { Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 30) }

      it "does not change the name" do
        expect(item.name).to eq "Backstage passes to a TAFKAL80ETC concert"
      end

      it "decrements sell_in" do
        expect(item.sell_in).to eq 14
      end

      it "increments quality" do
        expect(item.quality).to eq 31
      end

      context 'quality is at 50' do
        let(:item) { Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 50) }

        it "does not increment quality" do
          expect(item.quality).to eq 50
        end
      end

      context "when sell_in is less than or equal to 10" do
        let(:item) { Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 30) }

        it "decrements sell_in by 1" do
          expect(item.sell_in).to eq 9
        end

        it "increments quality by 2" do
          expect(item.quality).to eq 32
        end
      end

      context "when sell_in is less than or equal to 5" do
        let(:item) { Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 30) }

        it "decrements sell_in by 1" do
          expect(item.sell_in).to eq 4
        end

        it "increments quality by 3" do
          expect(item.quality).to eq 33
        end
      end

      context "when sell_in is decremented to less than 0" do
        let(:item) { Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 30) }

        it "decrements sell_in by 1" do
          expect(item.sell_in).to eq -1
        end

        it "sets the quality to 0" do
          expect(item.quality).to eq 0
        end
      end
    end
  end
end
