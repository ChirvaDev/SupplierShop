//
//  RootView.swift
//  SupplierShop
//
//  Created by Pro on 24.04.2023.
//

import SwiftUI

struct RootView: View {
    @State private var isContentViewPresented = false
    
    var body: some View {
        if isContentViewPresented {
            ContentView()
        } else {
            SplashScreenView()
                .withCustomStyle(isContentViewPresented: $isContentViewPresented)
        }
    }
}

extension SplashScreenView {

    func withCustomStyle(isContentViewPresented: Binding<Bool>) -> some View {
        self
            .frame(width: 250, height: 250)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    withAnimation {
                        isContentViewPresented.wrappedValue = true
                    }
                }
            }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
