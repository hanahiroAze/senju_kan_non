require "senju_kan_non/version"

module SenjuKanNon
  class << self
    def redeem(issai_shujo)
      return false unless issai_shujo.kind_of?(Hash)

      # TODO: need fix for issai has 3 or more params
      sekke(issai_shujo)
    end

    private

      def sekke(issai_shujo)
        keys = issai_shujo.keys
        @riyaku = Hash.new { |h,k| h[k] = {} }

        keys.each do |key|
          @riyaku[key] = []
        end

        keys.combination(2) do |first_eye, second_eye|
          first_hand = issai_shujo[first_eye]
          second_hand = issai_shujo[second_eye]
          gasshou(first_eye, first_hand, second_eye, second_hand)
        end
      end

      def gasshou(first_eye, first_hand, second_eye, second_hand)
        first_hand.each do |item|
          second_hand.each do |value|
            @riyaku[first_eye] << item
            @riyaku[second_eye] << value
          end
        end
      end
  end
end
