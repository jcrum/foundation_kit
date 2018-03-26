# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FoundationKit::Inventory do
  context 'basic inventory functionality' do
    let(:dummy) { described_class.new }

    subject { dummy }

    it { is_expected.to respond_to(:stock) }
    it { is_expected.to respond_to(:add) }
    it { is_expected.to respond_to(:count) }
    it { is_expected.to respond_to(:out_of_stock?) }
    it { is_expected.to respond_to(:remove) }
    it { is_expected.to respond_to(:use) }
    it { is_expected.to respond_to(:stock?) }
  end

  context 'basic functionality without any items added' do
    let(:dummy) { described_class.new }

    it 'should be out stock if nothing has been added' do
      expect(dummy.out_of_stock?).to be true
    end

    it 'should be able to remove an item' do
      expect(dummy.stock?).to be false
    end

    it 'should be able to remove an item' do
      expect(dummy.count).to eq(0)
    end
  end

  context 'basic functionality with a single item added' do
    let(:dummy) { described_class.new }
    let(:item1) { { foo: 'foo' } }

    before(:each) do
      dummy.add(name: :item1, item: item1)
    end

    context '#stock' do
      it 'should provide the ability to #add an item to inventory' do
        expect(dummy.stock).to eq(item1: { foo: 'foo' })
      end
    end

    context '#count' do
      it 'should provide the ability to #count the number of items in inventory' do
        expect(dummy.count).to be 1
      end

      it 'should be able to remove an item and return 0 count' do
        dummy.remove(name: :item1)
        expect(dummy.count).to eq(0)
      end
    end

    context '#out_of_stock?' do
      it 'should not be out stock if there is an item added' do
        expect(dummy.out_of_stock?).to be false
      end

      it 'should be able to remove an item' do
        dummy.remove(name: :item1)
        expect(dummy.out_of_stock?).to be true
      end
    end

    context '#use' do
      it 'should be able to #use an item' do
        expect(dummy.use(name: :item1)).to eq(item1)
      end
    end

    context '#stock?' do
      it 'should return true if there is stock' do
        expect(dummy.stock?).to be true
      end

      it 'should return false if stock is empty' do
        dummy.remove(name: :item1)
        expect(dummy.stock?).to be false
      end
    end
  end

  context '#add, #use, #remove should be able to pass name as symbol or string' do
    let(:dummy) { described_class.new }
    let(:item1) { { foo: 'foo' } }
    let(:item2) { { bar: 'bar' } }

    before(:each) do
      dummy.add(name: :item1, item: item1)
      dummy.add(name: 'item2', item: item2)
    end

    it 'should be able to #use an item by passing the name as a string when added as a symbol' do
      expect(dummy.use(name: 'item1')).to eq(item1)
    end

    it 'should be able to remove an item by passing the name as string when added as a symbol' do
      dummy.remove(name: 'item1')
      expect(dummy.count).to eq(1)
    end

    it 'should be able to #use an item by passing the name as a symbol when added as a string' do
      expect(dummy.use(name: :item2)).to eq(item2)
    end
    it 'should be able to remove an item by passing the name as a symbol when added as a string' do
      dummy.remove(name: :item2)
      expect(dummy.count).to eq(1)
    end
  end
end
