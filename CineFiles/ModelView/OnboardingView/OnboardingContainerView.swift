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
    var body: some View {
        TabView {
            Onboarding1View(usuario: usuario)
            Onboarding2View()
            Onboarding3View()
            Onboarding4View(usuario: usuario)
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .ignoresSafeArea()

    }
}
