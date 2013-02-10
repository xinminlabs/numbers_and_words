module NumbersAndWords
  module Strategies
    module Extensions
      module ExponentialPart
        attr_accessor :exponent_figures, :exponent_words

        def convert figures, options = {}
          @exponent_figures = figures.exponential_part.reverse
          @exponent_words = exponent_strings
          super
        end

        private

        def converted
          exponent_figures.any? && with_exponent(super) || super
        end

        def with_exponent coefficient_part
          translation_exponential coefficient_part, exponential_part
        end

        def exponential_part
          exponent_words.reverse.join(' ')
        end
      end
    end
  end
end
