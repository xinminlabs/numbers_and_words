# coding: utf-8
require 'spec_helper'

describe NumbersAndWords::TranslationsHelpers::Hu do
  let(:helper) { Object.new.tap { |o| o.extend described_class } }
  around(:each) { |example| ::I18n.with_locale(:hu) { example.run } }

  describe "#translation_coefficient" do
    def translated coefficient
      helper.translation_coefficient coefficient
    end

    tests = {
      "hat" => "hatszor",
      "száz" => "százszor",
      "egy" => "egyszer",
      "hét" => "hétszer",
      "harminc" => "harmincszor",
      "tíz" => "tízszer",
      "nyolc" => "nyolcszor",
      "millió" => "milliószor",
      "öt" => "ötször",
      "kettő" => "kettőször",
      "húsz" => "hússzor",
    }

    tests.each do |coefficient, expected|
      it("suffixes coefficient #{coefficient}") { translated(coefficient).should eq(expected) }
    end
  end

  describe "#translation_exponent_article" do
    def translated exponent
      helper.translation_exponent_article exponent
    end

    tests = {
      "harmadik" => "a",
      "ötödik" => "az",
    }

    tests.each do |exponent, expected|
      it("uses correct article for exponent #{exponent}") { translated(exponent).should eq(expected) }
    end
  end

  describe "#translation_exponent" do
    def translated exponent
      helper.translation_exponent exponent
    end

    tests = {
      "harmadik" => "harmadikon",
      "ötödik" => "ötödiken",
      "hatodik" => "hatodikon",
      "hetedik" => "hetediken",
    }

    tests.each do |exponent, expected|
      it("suffixes exponent #{exponent}") { translated(exponent).should eq(expected) }
    end
  end
end
