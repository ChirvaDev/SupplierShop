//
//  PaginationLogic.swift
//  SupplierShop
//
//  Created by Pro on 28.04.2023.
//

import Foundation

class PaginationLogic: ObservableObject {
    @Published var currentPage = 1
    @Published var totalPages = 1
    
    func update(totalItems: Int) {
        totalPages = Int(ceil(Double(totalItems) / Double(2)))
    }
    
    func loadNextPage() {
        guard currentPage < totalPages else { return }
        currentPage += 1
    }
    
    func reset() {
        currentPage = 1
    }
}
