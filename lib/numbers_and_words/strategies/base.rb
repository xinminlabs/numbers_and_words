module NumbersAndWords
  module Strategies
    class Base
      include Extensions::IntegerPart
      include Extensions::FractionalPart
      include Extensions::ExponentialPart
      include Extensions::Ordinal

      attr_accessor :options

      def self.factory
        "NumbersAndWords::Strategies::#{::I18n.locale.to_s.titleize}".constantize.new
      end

      def convert figures, options = {}
        @options = options
        super
      end
    end
  end
end
