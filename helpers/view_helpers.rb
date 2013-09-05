module RCDB
  module ViewHelpers
    def text_input(title, entry, field)
      erb :column_editor, locals: {title: title, 
                                   value: entry.send(field), 
                                   field_name: field}
    end

    def date_added(solve)
      solve.date_added.strftime("%b %-d, %Y")
    end

    def garronize(solve)
      alg = garronize_alg(solve.solution)
      ini = garronize_alg(solve.scramble)
      puz = solve.puzzle.garronized_name
      "http://alg.garron.us/?alg=#{alg}&ini=#{ini}&cube=#{puz}" 
    end

    def ksim_link(solve)
      "http://snk.digibase.ca/ksim.htm?colours=white,lime,red,yellow,blue,orange&alg=#{@solve.scramble.gsub(/\s/,"")}"
    end

    def ellipsize(text, max = 100)
      text = text.to_s
      if text.length <= max
        text
      else
        text[0..max] + "..."
      end
    end

    private

    def garronize_alg(alg)
      alg.tr("' ", "-_").gsub("\n","%0A")
    end

    def cubic?(puzzle)
      puzzle.name =~ /\dx\d/
    end
  end
end
