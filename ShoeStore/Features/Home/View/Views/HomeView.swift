//
//  ContentView.swift
//  ShoeStore
//
//  Created by Felipe Assis on 17/6/2024.
//

import SwiftUI
import Core

struct HomeView: View {
    
    //@StateObject var homeViewModel = HomeViewModel()
    @State var name = ""
    let cache = getCacheManger()
    let keychain = getSecureStorageManager()

    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Olá \(keychain.get(for: "name") ?? "")")
                .padding()
            BannerTabView()
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
