module NumbersAndWords
  module TranslationsHelpers
    module Hu
      include NumbersAndWords::TranslationsHelpers::Base
      include NumbersAndWords::TranslationsHelpers::Families::Latin
      include NumbersAndWords::TranslationsHelpers::Extensions::FractionSignificance

      def translation_tens_with_ones numbers
        ones, tens = numbers
        [t(:tens_with_ones)[tens], translation_ones(ones)].join ''
      end

      def translation_hundreds number, separator = ''
        super
      end

      def translation_micros capacity, number = nil, separator = ''
        super capacity, nil, separator
      end

      def translation_ordinal_tens_with_ones numbers
        ones, tens = numbers
        [t(:tens_with_ones)[tens], t("ordinals.ones_with_tens")[ones]].join ''
      end

      def translation_ordinal_hundreds number, separator = ''
        super
      end

      def translation_exponential coefficient, exponent
        coefficient_str = coefficient + coefficient_suffix(coefficient)
        exponent_str = exponent + exponent_suffix(exponent)
        t(:exponential, :coefficient => translation_coefficient(coefficient),
          :exponent => translation_exponent(exponent),
          :article => translation_exponent_article(exponent))
      end

      def translation_coefficient coefficient
        if coefficient[-2..-1] == "sz"
          coefficient[0..-2] + coefficient_suffix(coefficient)
        else
          coefficient + coefficient_suffix(coefficient)
        end
      end

      def translation_exponent exponent
        exponent + exponent_suffix(exponent)
      end

      def translation_exponent_article exponent
        starts_with = starts_with_vowel?(exponent) && :vowel || :consonant
        t "exponent_article.starts_with_#{starts_with}"
      end

      def coefficient_suffix coefficient
        t(:coefficient_suffix)[last_vowel(coefficient).to_sym]
      end

      def exponent_suffix exponent
        key = exponent.split(//u).last(4).join
        t exponent_suffix_key(key), :default => exponent_suffix_key(:default)
      end

      def exponent_suffix_key key
        [:exponent_suffix, ".", key].join.to_sym
      end

      def starts_with_vowel? str
        vowels.include? str.split(//u).first
      end

      def last_vowel str
        str.split(//u).reverse.detect { |c| vowels.include? c }
      end

      def vowels
        @vowels ||= t(:vowels)
      end
    end
  end
end
