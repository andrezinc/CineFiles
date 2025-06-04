//  ViewCatalago.swift
//  CineFiles
//
//  Created by Andre Castilhano on 29/05/25.
//

//View Para Conta
//AFFF CODIGO CHATO DA PORRAAAAA
// FilmModel
import SwiftUI
struct ViewParaVoce: View {
    @Binding var filmes : [Filme]
    var body: some View {
        GeometryReader { geo in
            GeometryReader { geo in
                ZStack{
                    Aparecimento(filmes:$filmes, size: geo.size)
                }.ignoresSafeArea()
            }
            
        }
    }
    
    
    
}
struct Aparecimento: View {
    @Binding var filmes : [Filme]
    @State var size: CGSize
    var body: some View {
        TabView {
            ForEach(0..<1000, id: \.self) { index in
                let numeroRandomico = index % filmes.count
                let filmeRandomico = filmes[numeroRandomico]
                ZStack{
                    ViewVideo(filme: filmeRandomico.image,size: size)
                        .onTapGesture(count: 2) {
                            Clique(filme: $filmes[numeroRandomico])
                        }
                        .ignoresSafeArea()
                    ZStack{
                        Rectangle()
                            .frame(width: 700,height: 300)
                            .foregroundColor(Color.black.opacity(0))
                        
                        HStack{
                            VStack(alignment:.leading,spacing:16){
                                Text(filmeRandomico.titulo)
                                    .font(.system(size:30))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.branCE)
                                    .frame(width: 300,alignment: .leading)
                                VStack(alignment:.leading,spacing:9){
                                    Text("Direção: \(filmeRandomico.direcao)")
                                        .font(.system(size:18))
                                        .foregroundStyle(.branCE)
                                        .frame(width: 300,alignment: .leading)
                                    Text("Roteristas: \(filmeRandomico.roteristas)")
                                        .font(.system(size:18))
                                        .foregroundStyle(.branCE)
                                        .frame(width: 300,alignment: .leading)
                                    Text("Ano: \(String(filmeRandomico.ano))")
                                        .font(.system(size:18))
                                        .foregroundStyle(.branCE)
                                        .frame(width: 300,alignment: .leading)
                                }
                            }
                            .padding(.trailing,30)
                            VStack(spacing:24){
                                BotaoCoracao(filme: $filmes[numeroRandomico])
                                BotaoQuero(filme: $filmes[numeroRandomico])

                            }
                            .padding(.trailing,50)

                        }.background {
                            Rectangle()
                                .opacity(0)
                                .frame(width:800,height:300,)
                                .overlay{
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            .black,
                                            Color(red: 0, green: 0, blue: 0).opacity(1),Color(red: 0, green: 0, blue: 0).opacity(0)
                                        ]),
                                        startPoint: .bottom,
                                        endPoint: .top
                                    )
                                }
                        }
                    }.offset(x:25,y:220)
                    
                }.rotationEffect(.degrees(-90))
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .padding(.top, -50)
        .rotationEffect(.degrees(90))
        .frame(width: size.height, height: size.width)
        .offset(x: -250, y: 210)
    }
    
    
    private func Clique(filme: Binding<Filme>){
            filme.wrappedValue.isFavorite = true
    }

    private func BotaoCoracao(filme: Binding<Filme>) -> some View {
        Button {
            filme.wrappedValue.isFavorite.toggle()  // Altera o estado de isFavorite
        } label: {
            Image(systemName: "heart.fill")
                .foregroundStyle( filme.wrappedValue.isFavorite ? .rosao : .branCE)
                .font(.system(size: 32))
        }
    }
    private func BotaoQuero(filme: Binding<Filme>) -> some View {
        Button {
            filme.wrappedValue.isWatched.toggle()  // Altera o estado de isFavorite
        } label: {
            Image(systemName: "bookmark.fill")
                .foregroundStyle( filme.wrappedValue.isWatched ? .verdao : .branCE)
                .font(.system(size: 32))
        }
    }
}


struct ViewVideo: View {
    @State var filme : String
    @State var size: CGSize
    var body: some View {
        VStack{
            Image(filme)
                .resizable()
                .scaledToFill()
                .frame(width: size.width, height: size.height)
                .ignoresSafeArea()
        }
    }
}

#Preview{
    ViewParaVoce(filmes:.constant([
        Filme(image: "filme1", titulo: "Tudo em Todo o Lugar ao Mesmo Tempo", sinopse: "Uma imigrante chinesa de meia idade se envolve em uma aventura louca, onde só ela pode salvar o mundo explorando outros universos que se conectam com as vidas que ela poderia ter levado", direcao: "Daniel Kwan, Daniel Scheinert", roteristas: "Daniel Kwan, Daniel Scheinert", ano: 2022, duracao: 139, isFavorite: false, isWatched: false),
        Filme(image: "filme2", titulo: "Cisne negro", sinopse: "Uma esforçada bailarina luta para manter sua sanidade após obter o papel principal no Lago dos Cisnes de Tchaikovsky.", direcao: "Darren Aronofsky", roteristas: "Mark Heyman, Andres Heinz, John J. McLaughlin", ano: 2010, duracao: 108, isFavorite: false, isWatched: false),]))
}
