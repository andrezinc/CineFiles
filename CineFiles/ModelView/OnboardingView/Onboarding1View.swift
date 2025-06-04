//
//  Onboarding1View.swift
//  CineFiles
//
//  Created by Luiza Gomide de Azeredo Costa on 31/05/25.
//

import SwiftUI

struct Onboarding1View: View {
    @State var usuario: String
    @Binding var selecao: Int 
    
    var body: some View {
        VStack{

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
                
            }.padding(.horizontal, 16)
            
            HStack(spacing: 16){
                if(selecao>0){
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
                }
                else{
                    NavigationLink{
                        ViewPrincialTab(conta:usuario)
                    }label:{
                        Text("Sou paia vo pular")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .foregroundStyle(.branCE)
                            .clipShape(.buttonBorder)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.rosao, lineWidth: 1)
                            )
                        
                        
                    }
                }
                Button {
                    selecao = selecao + 1
                }label:{
                    Text("Quero saber mais")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .foregroundStyle(.branCE)
                        .background(.rosao)
                        .clipShape(.buttonBorder)
                    
                    
                }
            }.padding(16)
            .padding(.top,16)
        }
    }
}

