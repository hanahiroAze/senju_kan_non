require "senju_kan_non/version"

module SenjuKanNon
  class << self
    def redeem(issai_shujo)
      return false unless issai_shujo.kind_of?(Hash)

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

        fill_short_values(issai_shujo)
        formatted_riyaku = parse_columns_to_row
        genze_riyaku(keys, formatted_riyaku)

        formatted_riyaku
      end

      def gasshou(first_eye, first_hand, second_eye, second_hand)
        first_hand.each do |item|
          second_hand.each do |value|
            @riyaku[first_eye] << item
            @riyaku[second_eye] << value
          end
        end
      end

      def fill_short_values(issai_shujo)
        filling_size = @riyaku.values.map(&:size).max
        @riyaku.each do |eye, hand|
          if hand.size < filling_size
            (1..(filling_size - hand.size)).each do |num|
              if issai_shujo[eye][num].nil?
                @riyaku[eye] << issai_shujo[eye][0]
              else
                @riyaku[eye] << issai_shujo[eye][num]
              end
            end
          end
        end
      end

      def parse_columns_to_row
        @riyaku.values.transpose.uniq
      end

      def genze_riyaku(keys, formatted_riyaku)
        file_name = "#{Time.now.strftime("%Y%m%d%H%M%S")}_#{keys.join("_")}.txt"
        FileUtils.mkdir_p("test/senju_kan_non/") unless FileTest.exist?("test/senju_kan_non/")
        File.open("test/senju_kan_non/#{file_name}", "w") do |f|
          formatted_riyaku.each do |fr|
            f.puts(fr.to_s)
          end
        end
      end
    end
end
