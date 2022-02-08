# README

See test cases in `spec/schema_spec.rb`.

Run:

```
bundle
bin/rails spec
```

Output excerpt:

```
.F

Failures:

  1) GraphqlValidationComplexitySchema errors with connection type
     Failure/Error: result = described_class.execute(query_string, max_complexity: 100)

     NoMethodError:
       undefined method `[]' for #<GraphQL::Schema::Validator::ValidationFailedError:0x000000011d389c80>
```

