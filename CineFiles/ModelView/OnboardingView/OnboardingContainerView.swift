//
//  OnboardingContainerView.swift
//  CineFiles
//
//  Created by Luiza Gomide de Azeredo Costa on 02/06/25.
//

import Foundation
import SwiftUI

struct OnboardingContainerView: View {
    @State var usuario: String
    @State var selecao: Int = 0
    var body: some View {
        NavigationStack{
            
            VStack{
                TabView(selection: $selecao) {
                    Onboarding1View(usuario: usuario,selecao: $selecao).tag(0)
                    Onboarding2View(selecao: $selecao).tag(1)
                    Onboarding3View(selecao:$selecao).tag(2)
                    Onboarding4View(usuario: usuario,selecao: $selecao).tag(3)
                }
                
            }   .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .animation(.easeInOut, value: selecao)
                .padding(.top,200)// esse diminui pro texto ficar no centro

                .padding(.bottom,200) // Esse basicamente aumenta o tamanho do pagecontrol

                .background(                Color.pretoAzul
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
                        ZStack{
                                Spacer()
                                Image("fundofilmes") //
                                    .resizable()
                                    .scaledToFit()
                                    .offset(y:300)
                            
                        }
                    }
                )
                .ignoresSafeArea()
                .navigationBarBackButtonHidden()
        }
    }
}
    #Preview {
        OnboardingContainerView(usuario: "Amigo")
    }
