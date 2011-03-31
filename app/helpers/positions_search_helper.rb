module PositionsSearchHelper
  
  def array_from_position_attribute(attribute)
    @attribute = attribute
    @attributeArray = Position.find(:all, :select => "DISTINCT(@attribute)").map(&:@attribute)
    return @attributeArray
  end
  
  def put_some_text(something)
    return something
  end
end
