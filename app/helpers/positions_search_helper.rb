module PositionsSearchHelper
  
  def results_for_query(query)
    if query[:location]
      @location = query[:location]
    else
      @location = "%"
    end
    if query[:department]
      @department = query[:department]
    else
      @department = "%"
    end
    @where = 'location like \'' + @location + '\' and department like \'' + @department + '\''
    Position.where( @where )
  end
  
  def query_for_search(query)
        if query[:location]
      @location = query[:location]
    else
      @location = "\%"
    end
    if query[:department]
      @department = query[:department]
    else
      @department = "\%"
    end
    'location like \'' + @location + '\' and department like \'' + @department + '\''
  end
end
