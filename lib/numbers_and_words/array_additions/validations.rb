module NumbersAndWords
  module ArrayAdditions
    module Validations
      VALID_FORMAT = /\A\-?\d+(\.\d+)?(e[+\-]\d+)?\z/.freeze

      def validate_figure_array! options = {}
        raise "Figures format is invalid." unless valid_format?
        raise "Figures may not have a fractional part when :ordinal is true." if options[:ordinal] && fractional?
        raise "Figures may not have an exponential part when :ordinal is true." if options[:ordinal] && exponential?
      end

      def valid_format?
        join.match VALID_FORMAT
      end
    end
  end
end
