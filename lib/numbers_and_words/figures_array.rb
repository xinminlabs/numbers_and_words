module NumbersAndWords
  class FiguresArray < Array
    include NumbersAndWords::ArrayAdditions::Helpers
    include NumbersAndWords::ArrayAdditions::Validations

    def to_words strategy, options = {}
      validate_figure_array! options
      strategy.convert casted_array, options
    end

    def integer_part
      self[integer_range].to_figures
    end

    def fractional_part
      fractional? && trimmed_fractional_part || empty_figures
    end

    def exponential_part
      exponential? && self[exponent_range].to_figures || empty_figures
    end

    def reverse
      super.to_figures
    end

    private

    def casted_array
      cast = ("0".."9")
      map { |digit| cast.include?(digit) && digit.to_i || digit }.to_figures
    end

    def empty_figures
      [].to_figures
    end

    def trimmed_fractional_part
      list = self[fraction_range].reverse.drop_while { |i| i == 0 }.reverse
      list.empty? && empty_figures || list.to_figures
    end
  end
end
