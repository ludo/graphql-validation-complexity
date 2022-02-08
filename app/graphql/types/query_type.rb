module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :foo, String do
      argument :bar, String do
        validates format: { with: /^\d{5}$/ }
      end
    end
    def foo
      "Hello World!"
    end

    field :items, Types::ItemType.connection_type, null: false do
      argument :bar, String do
        validates format: { with: /^\d{5}$/ }
      end
    end
    def items
      []
    end
  end
end
