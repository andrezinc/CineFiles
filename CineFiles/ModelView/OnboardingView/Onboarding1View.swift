//
//  Onboarding1View.swift
//  CineFiles
//
//  Created by Luiza Gomide de Azeredo Costa on 31/05/25.
//

import SwiftUI

struct Onboarding1View: View {
    @State var usuario: String
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
                .offset(y:-30)
            VStack{
                Spacer()
                Image("fundofilmes")
                    .resizable()
                    .scaledToFit()
                    .offset(y: 34)
            }
            VStack(alignment: .leading, spacing: 24){
                Text("Oiii \(usuario)! Que bom te ter aqui!")
                    .foregroundStyle(.branCE)
                    .font(.system(size:32))
                    .fontWeight(.medium)
                VStack {
                    Text("Este é o começo de uma grande jornada — você irá passar por muitas aventuras, mergulhando em um mundo secreto que apenas os mais intelectuais podem acessar\n\nAqui é sua nova casa, onde você encontra os melhores filmes do planeta ") + Text(Image(systemName: "globe.americas.fill"))
                } .foregroundStyle(.branCE)
                    .font(.system(size:16))
                    .fontWeight(.regular)
                    .frame(width: 361, alignment: .leading)
                
//                HStack(spacing: 16){
//                    NavigationLink{
//                        ViewPrincialTab(conta:usuario)
//                    }label:{
//                        Text("So paia vo pular")
//                            .frame(maxWidth: .infinity)
//                            .padding(.vertical, 16)
//                            .foregroundStyle(.branCE)
//                            .clipShape(.buttonBorder)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 12)
//                                    .stroke(Color.rosao, lineWidth: 1) // contorno branco com 2pt de espessura
//                            )
//                        
//                        
//                    }
//                }
//                    Button {
//                    }label:{
//                        Text("Quero saber mais")
//                            .frame(maxWidth: .infinity)
//                            .padding(.vertical, 16)
//                            .foregroundStyle(.branCE)
//                            .background(.rosao)
//                            .clipShape(.buttonBorder)
//                        
//                            
//                    }
//                } .padding(.top, 16)
                
            }.padding(.horizontal, 16)
        }.ignoresSafeArea()
        
    }
}

