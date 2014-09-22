require 'spec_helper'

describe AWSCloudSearch::SuggestResponse do

  let(:suggestions_array) do
    [
      {"suggestion" => "Ocean's Eleven","score" => 0,"id" => "tt0054135"},
      {"suggestion" => "Ocean's Thirteen","score" => 0,"id" => "tt0496806"},
      {"suggestion" => "Ocean's Twelve","score" => 0,"id" => "tt0349903"}
    ]
  end

  let(:respose_body) do 
    {
      "status" => {
        "rid" => "646f5s0oDAr8pVk=",
        "time-ms" => 2
      },
      "suggest" => {
         "query" => "oce",
         "found"=> 3,
         "suggestions" => suggestions_array
      }
    }
  end

  subject(:response){ AWSCloudSearch::SuggestResponse.new(respose_body) }

  it "should correctly initialize from hash" do 
    expect(response.found).to eq(3)
    expect(response.suggestions).to be_an(Array)
  end

  it "returns suggestions with #results method" do
    expect(response.results).to be_an(Array)
    expect(response.results).to match_array(suggestions_array)
  end
end