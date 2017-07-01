require "senju_kan_non/version"

module SenjuKanNon

  class << self
    def redeem(issai)
      return false unless issai.kind_of?(Hash)

      keys = issai.keys
      idx = 0

      issai.each_value do |shujo|
        return false unless shujo.kind_of?(Array)
        neighbor = issai[keys[idx + 1]]
        return nil unless neighbor

        # TODO: need fix for issai has 3 or more params
        return combine(shujo, neighbor)
      end
    end

    private

      def combine(base, values)
        return nil unless values.kind_of?(Array)
        combinations = []
        base.each do |item|
          values.each do |value|
            combinations << [item,value]
          end
        end

        combinations
      end
  end
end
