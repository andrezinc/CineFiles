//
//  ViewDetelhes.swift
//  CineFiles
//
//  Created by Andre Castilhano on 29/05/25.
//

//Detalhes dos filmes
import SwiftUI
struct ViewDetelhes: View {
    @Binding var filme: Filme
    @State private var TempisFavorite = false
    @State private var TempisWatched = false
    var body: some View {
        ZStack{
            Color.pretoAzul
                .ignoresSafeArea()
            ScrollView{
                VStack{
                    Image(filme.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width:200)
                        .cornerRadius(8)
                    Text(filme.titulo)
                        .foregroundStyle(.branCE)
                        .font(.system(size: 24))
                        .multilineTextAlignment(.center)
                    Text("\(String(filme.ano)) | \(filme.duracao) min")
                        .foregroundStyle(.branCE)
                        .font(.system(size: 16))
                    HStack{
                        BotaoCoracao(filme: $TempisFavorite)
                        BotaoQuero(filme:
                                    $TempisWatched)
                    }
                    VStack(alignment:.leading,spacing:32){
                        VStack(alignment:.leading,spacing: 8){
                            Text("Sinopse")
                                .foregroundStyle(.branCE)
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                            Text(filme.sinopse)
                                .foregroundStyle(.branCE)
                                .font(.system(size: 16))
                        }
                        VStack(alignment:.leading,spacing: 8){
                            Text("Direção")
                                .foregroundStyle(.branCE)
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                            Text(filme.direcao)
                                .foregroundStyle(.branCE)
                                .font(.system(size: 16))
                        }
                        VStack(alignment:.leading,spacing: 8){
                            Text("Roteristas")
                                .foregroundStyle(.branCE)
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                            Text(filme.direcao)
                                .foregroundStyle(.branCE)
                                .font(.system(size: 16))
                        }
                    }.padding(.top,32)
                    ZStack{
                        Image("tiraRosa")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .scaleEffect(2)
                            .rotationEffect(Angle(degrees: -2.61))
                    }
                }.padding()
            }
        }.onAppear(){
            TempisFavorite = $filme.wrappedValue.isFavorite
            TempisWatched = $filme.wrappedValue.isWatched
        }
        .onDisappear(){
            $filme.wrappedValue.isFavorite = TempisFavorite
            $filme.wrappedValue.isWatched = TempisWatched
        }
    }
    
    private func BotaoCoracao(filme: Binding<Bool>) -> some View {
        Button {
            filme.wrappedValue.toggle()  // Altera o estado de isFavorite
        } label: {
            HStack{
                Text("Favorito")
                Image( systemName: filme.wrappedValue ?  "heart.fill":  "heart" )
            }
            .foregroundStyle(filme.wrappedValue ? .branCE : .azulzao )
            .padding(.horizontal,18)
            .padding(.vertical,10)
            .background(filme.wrappedValue ? .rosao :.branCE)
            .cornerRadius(20)
            
        }
    }
    private func BotaoQuero(filme: Binding<Bool>) -> some View {
        Button {
            filme.wrappedValue.toggle()  // Altera o estado de isFavorite
        } label:{
            HStack{
                Text("Quero Ver")
                Image( systemName: filme.wrappedValue ?  "bookmark.fill":  "bookmark")
            }
            .foregroundStyle(filme.wrappedValue ? .branCE : .azulzao )
            .padding(.horizontal,18)
            .padding(.vertical,10)
            .background(filme.wrappedValue ? .rosao :.branCE)
            .cornerRadius(20)
            
        }
    }
}
#Preview{
    ViewDetelhes(filme: .constant(Filme(image: "filme1", titulo: "Tudo em Todo o Lugar ao Mesmo Tempo", sinopse: "Uma imigrante chinesa de meia idade se envolve em uma aventura louca, onde só ela pode salvar o mundo explorando outros universos que se conectam com as vidas que ela poderia ter levado", direcao: "Daniel Kwan, Daniel Scheinert", roteristas: "Daniel Kwan, Daniel Scheinert", ano: 2022, duracao: 139, isFavorite: false, isWatched: false)))
}
