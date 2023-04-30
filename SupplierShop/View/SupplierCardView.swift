//
//  SupplierCardView.swift
//  SupplierShop
//
//  Created by Pro on 24.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct SupplierCardView: View {
    @State private var isShowingNoResultsView = false
    let vendor: Vendor
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                WebImage(url: URL(string: vendor.coverPhoto.mediaURL))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(10)
                
                Text(vendor.companyName)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(vendor.businessType)
                    .font(.subheadline)
                    .foregroundColor(Color("MainColor"))
                    .fontWeight(.bold)
                    .lineLimit(.min)
                
                HStack {
                    ForEach(vendor.categories, id: \.id) { category in
                        Text(category.name)
                            .font(.footnote)
                            .foregroundColor(.white)
                            .padding(7)
                            .background(Color("MainColor"))
                            .clipShape(Capsule())
                    }
                }
            }
            
            Text(vendor.areaServed)
                .foregroundColor(.black)
                .padding(5)
                .background(Color.white)
                .opacity(0.7)
                .clipShape(Capsule())
                .offset(x: -135, y: 20)
        }
    }
}

struct SupplierCardView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView()
        SupplierCardView(vendor: .init(
            id: 99,
            companyName: "Florists + Fashion",
            areaServed: "Newry",
            shopType: "Bike Shop",
            favorited: false,
            follow: false,
            businessType: "virtual",
            coverPhoto: .init(id: 984, mediaURL: "https://cdn-staging.chatsumer.app/eyJidWNrZXQiOiJjaGF0c3VtZXItZ2VuZXJhbC1zdGFnaW5nLXN0b3JhZ2UiLCJrZXkiOiIxMy84ZjMzZTgyNy0yNzIxLTQ3ZjctYjViNS0zM2Q5Y2E2MTM1OGQuanBlZyJ9",
                              mediaType: "image"),
            categories: .init(),
            tags: .init()
        )
        )
    }
}








