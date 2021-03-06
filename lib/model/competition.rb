module RCDB
  class Competition < Sequel::Model
    extend Field
    one_to_many :averages

    def to_s
      name.to_s
    end

    def at
      if official?
        "at #{link}"
      else
        ""
      end
    end

    def url
     "https://www.worldcubeassociation.org/results/c.php?i=#{url_code}"
    end

    private

    def official?
      name != "Unofficial"
    end

    def url_code
      code || name.gsub(" ","")
    end

    def link
      "<a href=#{url} target='_blank'>#{name}</a>"
    end
  end
end
