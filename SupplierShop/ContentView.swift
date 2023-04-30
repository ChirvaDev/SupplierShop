//
//  ContentView.swift
//  SupplierShop
//
//  Created by Pro on 21.04.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var dataLoader = DataLoader()
    @State private var searchingText = ""
    @StateObject private var pagination = PaginationLogic()
    
    var filteredVendors: [Vendor] {
        dataLoader.vendors.filter { vendor in
            searchingText.count < 3 ? true : vendor.companyName.localizedCaseInsensitiveContains(searchingText)
        }
        .prefix(pagination.currentPage * 2)
        .map { $0 }
    }
    
    var body: some View {
        NavigationStack{
            HStack {
                List(filteredVendors, id: \.id) { vendor in
                    SupplierCardView(vendor: vendor)
                }
                .listStyle(.inset)
                .searchable(text: $searchingText)
            }
            .onAppear {
                Task {
                    await dataLoader.loadData()
                    pagination.update(totalItems: dataLoader.vendors.count)
                }
            }
            
            VStack{
                if filteredVendors.isEmpty {
                    NoResultsView()
                        .offset(y: -60)
                } else {
                    Button(action: {
                        pagination.loadNextPage()
                    }) {
                        Text("Load more")
                            .foregroundColor(Color("MainColor"))
                            .font(.body)
                            .bold()
                    }
                    .padding()
                    .disabled(pagination.currentPage >= pagination.totalPages)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




