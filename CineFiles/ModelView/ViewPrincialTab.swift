//
//  ViewPrincialTab.swift
//  CineFiles
//
//  Created by Andre Castilhano on 29/05/25.
//

//Contendo nada apenas
import SwiftUI

struct ViewPrincialTab: View {
    @State var conta: String
    @State private var filmes: [Filme] = .filmes()
    var body: some View {
        NavigationStack{
            TabView{
                Tab("Catálogo",systemImage: "movieclapper.fill"){
                    ViewCatalago(filmes:$filmes)
                }
                
                Tab("Para Você",systemImage: "sparkles"){
                    ViewParaVoce(filmes:$filmes)
                }
                Tab("Conta",systemImage: "person.fill"){
                    ViewConta(usuario: conta,filmes:$filmes)
                }
            }
            .onAppear(perform: {
                UITabBar.appearance().backgroundColor = UIColor.pretoAzul
                UITabBar.appearance().tintColor = UIColor.pretoAzul
                UITabBar.appearance().barTintColor = UIColor.pretoAzul
            })
        }.navigationBarBackButtonHidden()
    }
}
#Preview{
    ViewPrincialTab(conta:"OI")
}
//TabView{
//  Tab(Catalogo,systemImage:"globe"){
//      ViewCatalogo()
//  }
//  Tab(Paravoce,systemImage:"globe"){
//      ViewParaVoce()
//  }
//  Tab(ViewConta,systemImage:"globe"){
//      ViewConta()
//  }
//
