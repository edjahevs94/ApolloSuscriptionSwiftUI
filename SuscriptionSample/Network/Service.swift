//
//  Service.swift
//  SuscriptionSample
//
//  Created by EdgardVS on 3/05/23.
//

import Foundation
import Apollo
import ApolloWebSocket

class Service {
    
    static let shared = Service()
    
    /// A common store to use for `httpTransport` and `webSocketTransport`.
    ///
    
    let client: ApolloClient = {
        let store = ApolloStore()
        
        /// A web socket transport to use for subscriptions
        let webSocketTransport: WebSocketTransport = {
            let url = URL(string: Settings.shared.urlWsString)!
            let webSocketClient = WebSocket(url: url, protocol: .graphql_transport_ws)
            return WebSocketTransport(websocket: webSocketClient)
        }()
        
        /// An HTTP transport to use for queries and mutations
        let httpTransport: RequestChainNetworkTransport = {
            let url = URL(string: Settings.shared.urlString)!
            return RequestChainNetworkTransport(interceptorProvider: DefaultInterceptorProvider(store: store), endpointURL: url)
        }()
        
        /// A split network transport to allow the use of both of the above
        /// transports through a single `NetworkTransport` instance.
        let splitNetworkTransport = SplitNetworkTransport(
            uploadingNetworkTransport: httpTransport,
            webSocketNetworkTransport: webSocketTransport
        )
        
        /// Create a client using the `SplitNetworkTransport`.
        return ApolloClient(networkTransport: splitNetworkTransport, store: store)
    }()
}
