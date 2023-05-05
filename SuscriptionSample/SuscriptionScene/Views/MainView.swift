//
//  MainView.swift
//  SuscriptionSample
//
//  Created by EdgardVS on 3/05/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var mainViewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("\(mainViewModel.operationSuscripted.name )")
            }.onAppear{
                mainViewModel.suscriptionOperation()
            }
            .onDisappear{
                mainViewModel.suscription?.cancel()
            }
            NavigationLink(destination: Text("destino")) {
                Text("Link")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
