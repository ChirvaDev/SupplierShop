//
//  ReadJsonFile.swift
//  SupplierShop
//
//  Created by Pro on 21.04.2023.
//


import Foundation
    
class DataLoader: ObservableObject {
    @Published var vendors = [Vendor]()

    func loadData() async {
        do {
            if let fileURL = Bundle.main.url(forResource: "vendors", withExtension: "json") {
                let data = try await URLSession.shared.data(from: fileURL)
                let decoder = JSONDecoder()
                let result = try decoder.decode(DataModel.self, from: data.0)
                DispatchQueue.main.async {
                    self.vendors = result.vendors
                }
            } else {
                print("Error: file not found.")
            }
        } catch {
            print("Error reading data: \(error.localizedDescription)")
        }
    }
}

