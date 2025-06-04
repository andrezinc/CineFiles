//
//  Onboarding2View.swift
//  CineFiles
//
//  Created by Luiza Gomide de Azeredo Costa on 02/06/25.
//

import SwiftUI

struct Onboarding2View: View {
    @Binding var selecao: Int
    
    var body: some View {
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
                Text("""
                         Aqui você recebe apenas o filé do cinema!\n\nSalve seus \(Text("favoritos").foregroundStyle(.rosao).fontWeight(.bold)) \(Text(Image(systemName: "heart.fill")).foregroundStyle(.rosao)) e deixe marcado quais filmes você quer \(Text("assistir")
                         .foregroundStyle(.verdao)
                         .fontWeight(.bold)) \(Text(Image(systemName: "bookmark.fill")).foregroundStyle(.verdao)) depois
                         """)
                .foregroundStyle(.branCE)
                .font(.system(size:16))
            }.frame(width: 361, alignment: .leading)
            
            HStack(spacing: 16){
                    Button {
                        selecao = selecao - 1
                    }label:{
                        Text("Voltar")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .foregroundStyle(.branCE)
                            .clipShape(.buttonBorder)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.rosao, lineWidth: 1)
                            )
                        
                        
                    }
                Button {
                    selecao = selecao + 1
                }label:{
                    Text("Próximo")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .foregroundStyle(.branCE)
                        .background(.rosao)
                        .clipShape(.buttonBorder)
                    
                    
                }
            }
            .padding(.horizontal,16)
            .padding(.bottom,16)
        }
    }
}
