module NumbersAndWords
  module Strategies
    module Extensions
      module Ordinal

        private

        def converted
         ordinal? && ordinal_integer_part || super
        end

        def ordinal_integer_part
          words.empty? && zeroth || as_ordinal.reverse.join(' ')
        end

        def ordinal?
          options[:ordinal]
        end

        def as_ordinal
          words[1..-1].unshift(ordinal)
        end

        def ordinal
          if figures.teens
            translation_ordinal_teens(figures.ones)
          elsif figures.tens && figures.ones
            translation_ordinal_tens_with_ones(figures.tens_with_ones)
          elsif figures.ones
            translation_ordinal_ones(figures.ones)
          elsif figures.tens
            translation_ordinal_tens(figures.tens)
          elsif figures.hundreds
            translation_ordinal_hundreds(figures.hundreds)
          else
            translation_ordinal_megs(figures.ordinal_capacity)
          end
        end
      end
    end
  end
end
