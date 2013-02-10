module NumbersAndWords
  module Strategies
    module Extensions
      module IntegerPart
        attr_accessor :figures, :words

        def convert figures, options = {}
          @figures = figures.integer_part.reverse
          @words = strings

          converted
        end

        private

        def converted
          integer_part
        end

        def integer_part
          words.empty? && zero || words.reverse.join(' ')
        end
      end
    end
  end
end
