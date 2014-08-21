module NumbersAndWords
  module Translations
    class ZhCn < Base
      include NumbersAndWords::Translations::Families::Hanzi
      include NumbersAndWords::Translations::Extensions::FractionSignificance
    end
  end
end
