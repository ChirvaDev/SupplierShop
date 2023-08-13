//
//  NoResultsView.swift
//  SupplierShop
//
//  Created by Pro on 24.04.2023.
//

import SwiftUI

struct NoResultsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Sorry! No results found...")
                .font(.title)
                .foregroundColor(Color("MainColor"))
                .bold()
            
            Text("Please try a different search request or browse businesses from the list")
                .multilineTextAlignment(.center)
                .frame(width: 300)
            Spacer()
        }
    }
}

struct NoResultsView_Previews: PreviewProvider {
    static var previews: some View {
        NoResultsView()
    }
}
