class Numeric
  def to_words options = {}
    to_figures_array(options).to_words NumbersAndWords::Strategies::Base.factory, options
  end

  private

  def to_figures_array options = {}
    str = (options[:scientific] || options[:exponential]) && ("%e" % self) || to_s
    str.split(//).to_figures
  end
end
