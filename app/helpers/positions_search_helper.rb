module PositionsSearchHelper
  
  #returns the result set from the query
  def results_for_query(query)
    Position.where( query_for_search query )
  end
  
  #form a query based on the search parameters in the argument
  def query_for_search(query)
    if query[:location] != ''
      @location = query[:location]
    else
      @location = '%'
    end
    if query[:department] != ''
      @department = query[:department]
    else
      @department = '%'
    end
    if query[:title] != ''
      @title = query[:title]
    else
      @title = '%'
    end    
    'title like \'%' + @title + '%\' and location like \'' + @location + '\'' + ' and department like \'' + @department + '\' and is_open = 1'
  end
end
