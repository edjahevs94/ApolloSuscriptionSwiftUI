// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class WatchOperationSubscription: GraphQLSubscription {
  public static let operationName: String = "watchOperation"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      subscription watchOperation {
        operationFinished {
          __typename
          name
          endDate
        }
      }
      """#
    ))

  public init() {}

  public struct Data: MySuscription.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { MySuscription.Objects.Subscription }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("operationFinished", OperationFinished.self),
    ] }

    public var operationFinished: OperationFinished { __data["operationFinished"] }

    /// OperationFinished
    ///
    /// Parent Type: `Operation`
    public struct OperationFinished: MySuscription.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { MySuscription.Objects.Operation }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String.self),
        .field("endDate", String.self),
      ] }

      public var name: String { __data["name"] }
      public var endDate: String { __data["endDate"] }
    }
  }
}
