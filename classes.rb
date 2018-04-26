class Confection
  attr_accessor :name, :type, :price, :description, :allitems
  def initialize(name, type, price, description)
      @name = name
      @price = price
      @description = description
      @type = type
  end
end