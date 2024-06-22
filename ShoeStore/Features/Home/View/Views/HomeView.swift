//
//  ContentView.swift
//  ShoeStore
//
//  Created by Felipe Assis on 17/6/2024.
//

import SwiftUI
import Core

struct HomeView: View {
    let homeViewModel = HomeViewModel.instance
    let cache = getCacheManger()
    let keychain = getSecureStorageManager()
    @State var name = ""
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            
            Image(.brand)
                .resizable()
                .scaledToFit()
                .frame(width: 120)
            
//            Text("Olá \(keychain.get(for: "name") ?? "")")
//                .padding()
            
            BannerTabView()
                .padding(.bottom, 16)
                .padding(.top, 16)
            
            FiltersListView()
                .padding(.bottom, 16)
            
            StoresListView()
            
            Spacer()
        }
        .padding()
        .onAppear{
            Task {
                cache.save(key: "name", value: "Felipe")
                keychain.save(key: "name", value: "Aline")
            }
        }
    }
}


#Preview {
    HomeView()
}

