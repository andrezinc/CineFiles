//
//  Onboarding4View.swift
//  CineFiles
//
//  Created by Luiza Gomide de Azeredo Costa on 02/06/25.
//

import SwiftUI

struct Onboarding4View: View {
    @State var usuario: String
    @Binding var selecao: Int 
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 24){
                Image("cinefiles")
                
                
                Text("Curta só o filé")
                    .foregroundStyle(.branCE)
                    .font(.system(size:32))
                    .fontWeight(.medium)
                
                
                
                
                
                NavigationLink{
                    ViewPrincialTab(conta:usuario)
                }label:{
                    Text("Começar!")
                        .frame(width: 198)
                        .padding(.vertical, 16)
                        .foregroundStyle(.branCE)
                        .background(.rosao)
                        .clipShape(.buttonBorder)
                    
                    
                }
                .padding(.top, 16)
            }
        }
    }
}
