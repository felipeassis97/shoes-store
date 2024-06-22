//
//  ContentView.swift
//  ShoeStore
//
//  Created by Felipe Assis on 19/6/2024.
//

import SwiftUI

struct ContentView: View {
    //MARK: Monitora se existe a variavel no storage (funciona como uma stream)
    //@AppStorage(AppKeys.userToken) var token: String = ""
    
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label(title: {
                    Text("Home")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                },
                      icon: { Image(systemName: "house") }
                )}
            //
            NavigationStack {
                ProductsView()
            }
            .tabItem {
                Label(title: {
                    Text("Products")
                }, icon: {
                    Image(systemName: "magnifyingglass")
                }
                )}
            //
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label(title: {
                    Text("Profile")
                }, icon: {
                    Image(systemName: "person")
                }
                )}
            
        }
    }
}

#Preview {
    ContentView()
}
