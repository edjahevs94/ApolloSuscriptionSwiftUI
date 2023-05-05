//
//  MainViewModel.swift
//  SuscriptionSample
//
//  Created by EdgardVS on 3/05/23.
//

import Foundation
import MySuscription
import Apollo

class MainViewModel: ObservableObject {
    
    @Published var operationSuscripted: Operation = Operation(name: "Nothing", endDate: "No date")
    @Published var suscription: Cancellable?
    
    init() {
        Settings.setup(Settings.Config(token: " ", urlString: "http://localhost:3000/graphql", urlWsString: "ws://localhost:3000/graphql")) 
        suscriptionOperation()
    }
    
    func suscriptionOperation() {
        
        self.suscription = Service.shared.client.subscribe(subscription: WatchOperationSubscription()) { [weak self] (result) in
            switch result {
            case .success(let data):
                guard let operation = data.data?.operationFinished else {
                    return
                }
                self?.operationSuscripted = Operation(name: operation.name , endDate: operation.endDate )
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    

    
}
