require 'spec_helper'

describe WordDocument do
  context "validation" do
    it "should not create if word_list_file is not given" do
      expect{WordDocument.create}.to_not change{WordDocument.count}.by(1)
    end
  end
end
