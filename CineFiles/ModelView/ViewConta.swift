//
//  ViewCatalago.swift
//  CineFiles
//
//  Created by Andre Castilhano on 29/05/25.
//

//View para Conta
// Pegar ContaModel e FilmModel
import SwiftUI
import SDWebImageSwiftUI
struct ViewConta: View {
    @State var usuario: String
    @Binding var filmes : [Filme]
    var body: some View {
        ZStack{
            Color.pretoAzul
                .overlay{
                    LinearGradient(
                        gradient: Gradient(colors: [
                            .azulzao,
                            .pretoAzul,
                            .pretoAzul
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                } .ignoresSafeArea()
            
            VStack(alignment: .center){
                WebImage(url: URL(string:"https://media1.tenor.com/m/GLZZKZJyJAEAAAAd/dance-dancing-duck.gif"))
                    .resizable()
                    .frame(width: 100, height: 100)
                    .mask{
                        Circle()
                            .frame(width: 100, height: 100)

                    }
                Text(usuario)
                    .bold()
                    .foregroundStyle(.white)
                    .font(.system(size:30))
                    .padding(.bottom, 24)
                
                VStack(alignment: .leading,spacing: 20){
                    Text("Filmes favoritos")
                        .foregroundStyle(.branCE)
                        .font(.system(size: 20))
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 20){
                            Rectangle()
                                .frame(width: 1,height:200,alignment: .leading)
                                .opacity(0)
                                .ignoresSafeArea()
                                
                            ForEach($filmes){ $filme in
                                if(filme.isFavorite){
                                    NavigationLink{
                                        ViewDetelhes(filme:$filme)
                                    }label:{
                                        Image(filme.image)
                                            .resizable()
                                            .scaledToFill()
                                        
                                            .frame(width: 123,height:200,alignment: .leading)
                                            .cornerRadius(10)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(.branCE, lineWidth: 4)
                                            )
                                    }
                                }
                                
                            }
                        }
                    }
                    Text("Quero assistir")
                        .foregroundStyle(.branCE)
                        .font(.system(size: 20))
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 20){
                            Rectangle()
                                .frame(width: 1,height:200,alignment: .leading)
                                .opacity(0)
                            ForEach($filmes){ $filme in
                                if(filme.isWatched){
                                    NavigationLink{
                                        ViewDetelhes(filme:$filme)
                                    }label:{
                                        Image(filme.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 123,height:200,alignment: .leading)
                                            .cornerRadius(10)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(.branCE, lineWidth: 4)
                                            )
                                    }
                                }
                               
                            }

                        }
                        
                    }
                    
                }
                //adicionei o padding aqui tb
            } .padding(.horizontal, 16)
        }
    }
}

