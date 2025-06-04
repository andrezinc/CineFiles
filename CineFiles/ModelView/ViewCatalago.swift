//
//  ViewCatalago.swift
//  CineFiles
//
//  Created by Andre Castilhano on 29/05/25.
//

//View para Catalogo
// FilmModel pro filtro
import SwiftUI
struct ViewCatalago: View {
    @Binding var filmes: [Filme]
    @State var showFavorite : Bool = false
    @State var showQueroVer : Bool = false
    var body: some View {
        NavigationStack{
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
                    }
                    .ignoresSafeArea()
                
                ScrollView(.vertical){
                    Spacer()
                    VStack(alignment: .leading,spacing: 10){
                        Text("Catalogo de filmes")
                            .foregroundStyle(.branCE)
                            .font(.system(size: 32))
                            .bold()
                        Text("Filé da semana")
                            .foregroundStyle(.branCE)
                            .font(.system(size: 20))
                        ZStack{
                            Image(filmes[1].image)
                                .resizable()
                                .scaledToFill()
                                .clipShape(Rectangle())
                                .mask{
                                    Rectangle()
                                        .frame(width: .infinity, height: 251)
                                        .cornerRadius(20)
                                    
                                }
                                .frame(width: .infinity, height: 251)
                                .overlay{
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            .black.opacity(0),
                                            .pretoAzul.opacity(1)
                                        ]),
                                        startPoint: .top,
                                        endPoint: .bottom)
                                }
                            Text(filmes[1].titulo)
                                .foregroundStyle(.branCE)
                                .font(.system(size: 20))
                                .frame(width: 160,alignment: .leading)
                                .lineLimit(2)
                                .offset(x:-77,y:100)
                            
                        }.offset(x:-5)
                        HStack(spacing: 16){
                            BotaoCoracao(filme: $filmes[1])
                            BotaoQuero(filme: $filmes[1])
                        }
                        Spacer().frame(height: 10)
                        VStack(alignment: .leading,spacing: 20){
                            Text("Animado")
                                .foregroundStyle(.branCE)
                                .font(.system(size: 20))
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 20){
                                        ForEach($filmes){ $filme in
                                            NavigationLink{
                                                ViewDetelhes(filme:$filme)
                                            }label:{
                                                Image(filme.image)
                                                    .resizable()
                                                    .scaledToFill()
                                                //eu acho que entendi porque ficou estranha a borda, o frame deve ta cortando a parte de cima e de baixo da linha, mas nao sei como arrumar
                                                    .frame(width: 123,alignment: .leading)
                                                    .cornerRadius(10)
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(.branCE, lineWidth: 4)
                                                    )
                                            }
                                        }
                                    }
                            }
                            .ignoresSafeArea()

                            Text("Ação")
                                .foregroundStyle(.branCE)
                                .font(.system(size: 20))
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 20){
                                    ForEach($filmes){ $filme in
                                        NavigationLink{
                                            ViewDetelhes(filme:$filme)
                                        }label:{
                                            Image(filme.image)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 123,alignment: .leading)
                                                .cornerRadius(10)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(.branCE, lineWidth: 4)
                                                )
                                        }
                                    }
                                }
                            }.ignoresSafeArea()
                            Text("Aventura")
                                .foregroundStyle(.branCE)
                                .font(.system(size: 20))
                            
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 20){
                                    ForEach($filmes){ $filme in
                                        NavigationLink{
                                            ViewDetelhes(filme:$filme)
                                        }label:{
                                            Image(filme.image)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 123,alignment: .leading)
                                                .cornerRadius(10)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(.branCE, lineWidth: 4)
                                                )
                                        }
                                    }
                                }
                            }.ignoresSafeArea()
                        }
                        
                    }.padding()
                    
                }
            }
            
        }
    }
    private func BotaoCoracao(filme: Binding<Filme>) -> some View {
        Button {
            filme.wrappedValue.isFavorite.toggle()  // Altera o estado de isFavorite
        } label: {
            HStack{
                Text("Favorito")
                Image( systemName: filme.wrappedValue.isFavorite ?  "heart.fill":  "heart" )
            }
            .foregroundStyle(filme.wrappedValue.isFavorite ? .branCE : .azulzao )
            .padding(.horizontal,18)
            .padding(.vertical,10)
            .background(filme.wrappedValue.isFavorite ? .rosao :.branCE)
            .cornerRadius(20)
            
        }
    }
    private func BotaoQuero(filme: Binding<Filme>) -> some View {
        Button {
            filme.wrappedValue.isWatched.toggle()  // Altera o estado de isFavorite
        } label:{
            HStack{
                Text("Quero Ver")
                Image( systemName: filme.wrappedValue.isWatched ?  "bookmark.fill":  "bookmark")
            }
            .foregroundStyle(filme.wrappedValue.isWatched ? .branCE : .azulzao )
            .padding(.horizontal,18)
            .padding(.vertical,10)
            .background(filme.wrappedValue.isWatched ? .rosao :.branCE)
            .cornerRadius(20)
            
        }
    }
}
#Preview{
    ViewCatalago(filmes:.constant([
        Filme(image: "filme1", titulo: "Tudo em Todo o Lugar ao Mesmo Tempo", sinopse: "Uma imigrante chinesa de meia idade se envolve em uma aventura louca, onde só ela pode salvar o mundo explorando outros universos que se conectam com as vidas que ela poderia ter levado", direcao: "Daniel Kwan, Daniel Scheinert", roteristas: "Daniel Kwan, Daniel Scheinert", ano: 2022, duracao: 139, isFavorite: false, isWatched: false),
        Filme(image: "filme2", titulo: "Cisne negro", sinopse: "Uma esforçada bailarina luta para manter sua sanidade após obter o papel principal no Lago dos Cisnes de Tchaikovsky.", direcao: "Darren Aronofsky", roteristas: "Mark Heyman, Andres Heinz, John J. McLaughlin", ano: 2010, duracao: 108, isFavorite: false, isWatched: false),]))
}
