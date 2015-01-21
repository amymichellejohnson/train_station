require("spec_helper")

describe(Line) do

  describe(".all") do
  it("is initially empty") do
    expect(Line.all()).to(eq([]))
  end
end
