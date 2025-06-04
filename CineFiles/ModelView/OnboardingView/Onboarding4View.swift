//
//  Onboarding4View.swift
//  CineFiles
//
//  Created by Luiza Gomide de Azeredo Costa on 02/06/25.
//

import SwiftUI

struct Onboarding4View: View {
    @State var usuario: String
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
                    } .ignoresSafeArea()
                    .offset(y:-30)

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
                    
                }.padding(.horizontal, 16)
            }
            
        }.ignoresSafeArea()
    }
}
