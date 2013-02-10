module NumbersAndWords
  module Strategies
    module Extensions
      module FractionalPart
        attr_accessor :fraction_figures, :fraction_words

        def convert figures, options = {}
          @fraction_figures = figures.fractional_part.reverse
          @fraction_words = fraction_strings
          super
        end

        private

        def converted
          fraction_figures.any? && with_fraction || super
        end

        def with_fraction
          return fractional_part if words.empty? && !zero_with_fraction?
          [integer_part, fraction_separator, fractional_part].join ' '
        end

        def fractional_part
          fraction_words.reverse.join(' ')
        end

        def fraction_separator
          options[:fraction_separator] || translation_fraction_separator(options)
        end

        def zero_with_fraction?
          options[:zero_with_fraction]
        end
      end
    end
  end
end
