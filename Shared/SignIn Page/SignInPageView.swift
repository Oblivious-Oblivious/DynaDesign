//
//  SignInPageView.swift
//  DynaDesign
//
//  Created by Thanasis Papapostolou on 20/12/21.
//

import SwiftUI
import AuthenticationServices

struct SignInPageView: View {
    @Environment(\.colorScheme) var color_scheme;

    var body: some View {
        VStack {
            SignInWithAppleButton(
                .signIn,
                onRequest: configure,
                onCompletion: handle
            )
            .signInWithAppleButtonStyle(color_scheme == .dark ? .white : .black)
            .frame(width: 250, height: 45)
            .padding()
        };
    }
    
    func configure(_ request: ASAuthorizationAppleIDRequest) {
        print(request);
    }

    func handle(_ auth_result: Result<ASAuthorization, Error>) {
        print(auth_result);
    }
}

struct SignInPage_Previews: PreviewProvider {
    static var previews: some View {
        SignInPageView()
    }
}
