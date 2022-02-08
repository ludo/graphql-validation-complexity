require 'rails_helper'

RSpec.describe GraphqlValidationComplexitySchema do
  it "works fine outside connection type" do
    query_string = <<-GRAPHQL
      query {
        foo(bar: "abcde")
      }
    GRAPHQL

    result = described_class.execute(query_string, max_complexity: 100)

    assert_equal 1, result["errors"].length
  end

  it "errors with connection type" do
    query_string = <<-GRAPHQL
      query {
        items(first: 3, bar: "abcde") {
          nodes {
            title
          }
        }
      }
    GRAPHQL

    result = described_class.execute(query_string, max_complexity: 100)

    assert_equal 1, result["errors"].length
  end
end
