# frozen_string_literal: true

module FoundationKit
  #
  # Inventory mixin methods
  #
  # @author [jcrum]
  #
  module InventoryMixin
    #
    # Adds an item to inventory
    # @param name: [String,Symbol] Name of the item being added
    # @param item: [Object] The item being added to inventory
    def add(name:, item:)
      stock[name.to_sym] = item
    end

    #
    # Returns the inventory count
    #
    # @return [Integer]
    def count
      stock.count
    end

    #
    # Returns whether or not the inventory has items
    #
    # @return [Boolean]
    def stock?
      !stock.count.zero?
    end

    #
    # Returns whether or not the Inventory is empty
    #
    # @return [type] [description]
    def out_of_stock?
      stock.count.zero?
    end

    #
    # Removes an item from Inventory
    # @param name: [String, Symbol] Item name to be removed
    def remove(name:)
      stock.delete(name.to_sym)
    end

    #
    # Returns the current items in Inventory
    #
    # @return [Hash]
    def stock
      @stock ||= {}
    end

    #
    # Allows an item in inventory to be used
    # @param name: [String, Symbol]
    #
    # @return [Object] Item referenced by the supplied name
    def use(name:)
      stock[name.to_sym]
    end
  end

  #
  # Inventory provides ability to Store related items
  #  and 'use' them by referencing their names
  #
  # @author [jcrum]
  #
  class Inventory
    include FoundationKit::InventoryMixin
  end
end
