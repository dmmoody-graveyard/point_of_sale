require("spec_helper")

describe(Product) do
  describe("#name") do
    it("tells us the product name") do
      test_product = Product.new()
