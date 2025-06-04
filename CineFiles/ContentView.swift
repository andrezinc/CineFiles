//
//  ContentView.swift
//  CineFiles
//
//  Created by Andre Castilhano on 29/05/25.
//

import SwiftUI

struct ContentView: View {
    @State var usuario = ""
    @State private var senha = ""
    @State private var isShowingSenha = false

    var body: some View {
        NavigationStack{
            ZStack {
                VStack{
                    ZStack{
                        //Fundo preto com logo cinefilés
                        Rectangle()
                            .fill(.pretoAzul)
                            .ignoresSafeArea()
                        
                        VStack{
                            Image("cinefiles")
                                .padding(.top, 80)
                            Spacer()
                        }
                    }
                }
                
                VStack{
                    //Card de login
                    Spacer()
                    ZStack {
                        Rectangle()
                            .fill(.branCE)
                            .frame(height: 512)
                        
                            .cornerRadius(32)
                            .offset(y: 34)
                            .ignoresSafeArea()
                        
                        VStack(alignment: .leading, spacing: 24){
                            //Titulo da secao
                            Text("Crie sua conta")
                                .foregroundStyle(.pretoAzul)
                                .font(.system(size:32))
                                .fontWeight(.medium)
                                .padding(.bottom)
                            
                            //Campo de nome usuario
                            VStack(alignment: .leading, spacing: 8){
                                Text("Nome de usuário")
                                    .foregroundStyle(.cinzaBotao)
                                    .font(.system(size:16))
                                    .fontWeight(.semibold)
                                TextField("Insira seu e-mail",text: $usuario)
                                    .foregroundStyle(.black)
                                    .padding(.horizontal,12)
                                    .padding(.vertical,13)
                                    .background(.branCE)
                                    .clipShape(.buttonBorder)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(!usuario.isEmpty ? Color.rosao : Color.cinza2, lineWidth: 1)
                                    )
                                
                            }
                            //Campo senha
                            
                            VStack(alignment: .leading, spacing: 8){
                                Text("Senha")
                                    .foregroundStyle(.cinzaBotao)
                                    .font(.system(size:16))
                                    .fontWeight(.semibold)
                                
                                ZStack{
                                    if(!isShowingSenha){
                                        SecureField("Insira sua senha",text: $senha)
                                            .padding(.horizontal,12)
                                            .foregroundStyle(.black)
                                            .padding(.vertical,13)
                                            .background(.branCE)
                                            .clipShape(.buttonBorder)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .stroke(!senha.isEmpty ? Color.rosao : Color.cinza2, lineWidth: 1)
                                            )
                                    }
                                    else{
                                        TextField("Insira sua senha",text: $senha)
                                            .padding(.horizontal,12)
                                            .foregroundStyle(.black)
                                            .padding(.vertical,13)
                                            .background(.branCE)
                                            .clipShape(.buttonBorder)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .stroke(!senha.isEmpty ? Color.rosao : Color.cinza2, lineWidth: 1)
                                            )
                                    }
                                    HStack{
                                        Spacer()
                                        Button{
                                            isShowingSenha.toggle()
                                        }label:{
                                            Image(systemName:
                                                    isShowingSenha ? "eye.slash" : "eye" )
                                                .padding(.trailing)
                                                .foregroundStyle(.gray)
                                        }
                                    }
                                }
                            }
                            
                            NavigationLink{
                                
                                OnboardingContainerView(usuario: usuario)
                            }label: {
                                Text("Criar conta")
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 16)
                                    .foregroundStyle(.branCE)
                                    .background(usuario.isEmpty || senha.isEmpty ? Color(uiColor: .cinza2) : .rosao)
                                    .clipShape(.buttonBorder)
                            }
                            .disabled((usuario.isEmpty || senha.isEmpty))
                            .padding(.top, 16)
                            
                        } .padding(.horizontal, 16)
                    }
                    
                }
            }
            
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    ContentView()
}
