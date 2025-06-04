//
//  Onboarding2View.swift
//  CineFiles
//
//  Created by Luiza Gomide de Azeredo Costa on 02/06/25.
//

import SwiftUI

struct Onboarding2View: View {
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

            
            VStack(spacing: 24){
                Image(systemName: "film.stack")
                    .foregroundStyle(.branCE)
                    .font(.system(size:72))
                    .fontWeight(.medium)
                    
                
                Text("Curadoria Especial")
                    .foregroundStyle(.branCE)
                    .font(.system(size:32))
                    .fontWeight(.medium)
                    
                VStack {
                    Text("Aqui você recebe apenas o filé do cinema!\n\nSalve seus \(Text("favoritos").foregroundStyle(.rosao).fontWeight(.medium)) e deixe marcado quais filmes você quer \(Text("assistir").foregroundStyle(.verdao).fontWeight(.medium)) depois")
                        .foregroundStyle(.branCE)
                        .font(.system(size:16))
                }.frame(width: 361, alignment: .leading)
                
//                HStack(spacing: 16){
//                    Button {
//                    }label:{
//                        Text("Voltar")
//                            .frame(maxWidth: .infinity)
//                            .padding(.vertical, 16)
//                            .foregroundStyle(.branCE)
//                            .clipShape(.buttonBorder)
//                            .overlay(
//                                        RoundedRectangle(cornerRadius: 12)
//                                            .stroke(Color.rosao, lineWidth: 1) // contorno branco com 2pt de espessura
//                                    )
//                            
//                            
//                    }
//                    Button {
//                    }label:{
//                        Text("Próximo")
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

#Preview {
    Onboarding2View()
}
