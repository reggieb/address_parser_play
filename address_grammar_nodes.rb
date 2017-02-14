module AddressGrammar

  class AddressNode < Treetop::Runtime::SyntaxNode
    def attributes(array = nil, hash = {})
      array ||= elements
      array.to_a.inject(hash) do |h, element|
        if element.kind_of? OutputNode
          h[element.name] = element.text_value.strip
        else
          if element.elements
            attributes(element.elements, h)
          end
        end
        h
      end
    end
  end
  
  class OutputNode < Treetop::Runtime::SyntaxNode
    def name
      self.class.to_s.split('::').last.sub('Node', '').gsub(/([a-z])([A-Z])/, '\1_\2').downcase
    end
  end

  class StreetNode < OutputNode
  end

  class BuildingNode < OutputNode
  end

  class FlatNode < OutputNode
  end

  class TownNode < OutputNode
  end

  class StreetTwoNode < OutputNode
  end

  class StreetThreeNode < OutputNode
  end

  class PostcodeNode < OutputNode
  end

  class CountyNode < OutputNode
    def text_value
      super.gsub(/^[\,\s]+/, '')
    end
  end

  class BuildingNumberNode < OutputNode
  end


end