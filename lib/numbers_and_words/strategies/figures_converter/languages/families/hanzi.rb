module NumbersAndWords
  module Strategies
    module FiguresConverter
      module Languages
        module Families
          module Hanzi
            include Base

            def hundreds_number_to_words
              simple_number_to_words + [hundreds]
            end
          end
        end
      end
    end
  end
end
