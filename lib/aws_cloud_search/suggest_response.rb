module AWSCloudSearch
  class SuggestResponse
    attr_reader :response, :suggestions, :found

    alias :results :suggestions
    alias :count :found

    # Takes in the hash, representing the json object returned from a search request
    def initialize(response)
      @response = response
      suggest = @response['suggest']
      unless suggest.empty?
        @suggestions = suggest['suggestions']
        @found = suggest['found']
      end
    end

  end
end
