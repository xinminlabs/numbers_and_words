require 'spec_helper'

describe NumbersAndWords::ArrayAdditions::Validations do
  def figures str
    str.split(//).to_figures
  end

  def validate_figures str, options = {}
    figures(str).tap { |f| f.validate_figure_array! options }
  end

  ["42", "4.2", "0.42", "4.2e+42", "42e-42"].each do |valid|
    it "validates #{valid}" do
      expect { validate_figures valid }.to_not raise_error
    end
  end

  it "invalidates invalid characters" do
    expect { validate_figures "invalid" }.to raise_error("Figures format is invalid.")
  end

  context "when ordinal" do
    it "invalidates fractional part" do
      expect { validate_figures "1.2", :ordinal => true }.to raise_error("Figures may not have a fractional part when :ordinal is true.")
    end

    it "invalidates exponential part" do
      expect { validate_figures "1e+1", :ordinal => true }.to raise_error("Figures may not have an exponential part when :ordinal is true.")
    end
  end
end
