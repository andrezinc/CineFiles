//
//  Onboarding3View.swift
//  CineFiles
//
//  Created by Luiza Gomide de Azeredo Costa on 02/06/25.
//

import SwiftUI

struct Onboarding3View: View {
    @Binding var selecao: Int
    
    var body: some View {
        
        VStack(spacing: 24){
            Image(systemName: "sparkles")
                .foregroundStyle(.branCE)
                .font(.system(size:72))
                .fontWeight(.medium)
            
            
            Text("Personalizado")
                .foregroundStyle(.branCE)
                .font(.system(size:32))
                .fontWeight(.medium)
            
            VStack {
                Text("""
Um espaço personalizado só para você!\n\nDescubra novos filmes pensados para você, baseado nos seus \(Text("interesses").foregroundStyle(.verdao).fontWeight(.bold)) \(Text(Image(systemName: "sparkle")).foregroundStyle(.verdao).fontWeight(.medium))
""")
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
