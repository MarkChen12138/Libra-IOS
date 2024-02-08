//
//  ContractsManager.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/10/8.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ContractArray: Codable {
    let contracts: [Contract]
    let total, skip, limit: Int
}

struct Contract: Codable {
    let contractId: String
    let payDate: Date
    let issueDate: Date
    let arrivalDate: Date
    let contractNumber: String
    let seller: String
    let buyer: String
    let product: String
    let quality: String
    let quantity: String
    let origin: String
    let ship: String
    let unitPrice: String

    init(
        contractId: String,
        payDate: Date,
        issueDate: Date,
        arrivalDate: Date,
        contractNumber: String,
        seller: String,
        buyer: String,
        product: String,
        quality: String,
        quantity: String,
        origin: String,
        ship: String,
        unitPrice: String
    ) {
        self.contractId = contractId
        self.payDate = payDate
        self.issueDate = issueDate
        self.arrivalDate = arrivalDate
        self.contractNumber = contractNumber
        self.seller = seller
        self.buyer = buyer
        self.product = product
        self.quality = quality
        self.quantity = quantity
        self.origin = origin
        self.ship = ship
        self.unitPrice = unitPrice
    }
    
    enum CodingKeys: String, CodingKey {
        case contractId = "contract_id"
        case payDate = "pay_date"
        case issueDate = "issue_date"
        case arrivalDate = "arrival_date"
        case contractNumber = "contract_number"
        case seller = "seller"
        case buyer = "buyer"
        case product = "product"
        case quality = "quality"
        case quantity = "quantity"
        case origin = "origin"
        case ship = "ship"
        case unitPrice = "unit_price"
    }


    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.contractId = try container.decode(String.self, forKey: .contractId)
        self.payDate = try container.decode(Date.self, forKey: .payDate)
        self.issueDate = try container.decode(Date.self, forKey: .issueDate)
        self.arrivalDate = try container.decode(Date.self, forKey: .arrivalDate)
        self.contractNumber = try container.decode(String.self, forKey: .contractNumber)
        self.seller = try container.decode(String.self, forKey: .seller)
        self.buyer = try container.decode(String.self, forKey: .buyer)
        self.product = try container.decode(String.self, forKey: .product)
        self.quality = try container.decode(String.self, forKey: .quality)
        self.quantity = try container.decode(String.self, forKey: .quantity)
        self.origin = try container.decode(String.self, forKey: .origin)
        self.ship = try container.decode(String.self, forKey: .ship)
        self.unitPrice = try container.decode(String.self, forKey: .unitPrice)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.contractId, forKey: .contractId)
        try container.encode(self.payDate, forKey: .payDate)
        try container.encode(self.issueDate, forKey: .issueDate)
        try container.encode(self.arrivalDate, forKey: .arrivalDate)
        try container.encode(self.contractNumber, forKey: .contractNumber)
        try container.encode(self.seller, forKey: .seller)
        try container.encode(self.buyer, forKey: .buyer)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.quality, forKey: .quality)
        try container.encode(self.quantity, forKey: .quantity)
        try container.encode(self.origin, forKey: .origin)
        try container.encode(self.ship, forKey: .ship)
        try container.encode(self.unitPrice, forKey: .unitPrice)
    }
}



final class ContractsManager {
    
    static let shared = ContractsManager()
    private init() { }
    
    private let contractsCollection = Firestore.firestore().collection("contracts")
    
    private func contractDocument(contractId: String) -> DocumentReference {
        contractsCollection.document(contractId)
    }
    
    func uploadContract(contract: Contract) async throws {
        try contractDocument(contractId: String(contract.contractId)).setData(from: contract, merge: false)
    }
    
    func getContract(contractId: String) async throws -> Contract {
        try await contractDocument(contractId: contractId).getDocument(as: Contract.self)
    }
    
//    private func getAllContracts() async throws -> [Contract] {
//        try await contractsCollection
//            .getDocuments(as: Contract.self)
//    }
//
//    private func getAllContractsSortedByPrice(descending: Bool) async throws -> [Contract] {
//        try await contractsCollection
//            .order(by: Contract.CodingKeys.price.rawValue, descending: descending)
//            .getDocuments(as: Contract.self)
//    }
//
//    private func getAllContractsForCategory(category: String) async throws -> [Contract] {
//        try await contractsCollection
//            .whereField(Contract.CodingKeys.category.rawValue, isEqualTo: category)
//            .getDocuments(as: Contract.self)
//    }
//
//    private func getAllContractsByPriceAndCategory(descending: Bool, category: String) async throws -> [Contract] {
//        try await contractsCollection
//            .whereField(Contract.CodingKeys.category.rawValue, isEqualTo: category)
//            .order(by: Contract.CodingKeys.price.rawValue, descending: descending)
//            .getDocuments(as: Contract.self)
//    }
    
    private func getAllContractsQuery() -> Query {
        contractsCollection
    }
    
//    private func getAllContractsSortedByPriceQuery(descending: Bool) -> Query {
//        contractsCollection
//            .order(by: Contract.CodingKeys.price.rawValue, descending: descending)
//    }
//    
//    private func getAllContractsForCategoryQuery(category: String) -> Query {
//        contractsCollection
//            .whereField(Contract.CodingKeys.category.rawValue, isEqualTo: category)
//    }
//    
//    private func getAllContractsByPriceAndCategoryQuery(descending: Bool, category: String) -> Query {
//        contractsCollection
//            .whereField(Contract.CodingKeys.category.rawValue, isEqualTo: category)
//            .order(by: Contract.CodingKeys.price.rawValue, descending: descending)
//    }
//    
//    func getAllContracts(priceDescending descending: Bool?, forCategory category: String?, count: Int, lastDocument: DocumentSnapshot?) async throws -> (contracts: [Contract], lastDocument: DocumentSnapshot?) {
//        var query: Query = getAllContractsQuery()
//
//        if let descending, let category {
//            query = getAllContractsByPriceAndCategoryQuery(descending: descending, category: category)
//        } else if let descending {
//            query = getAllContractsSortedByPriceQuery(descending: descending)
//        } else if let category {
//            query = getAllContractsForCategoryQuery(category: category)
//        }
//        
//        return try await query
//            .startOptionally(afterDocument: lastDocument)
//            .getDocumentsWithSnapshot(as: Contract.self)
//    }
//    
//    func getContractsByRating(count: Int, lastRating: Double?) async throws -> [Contract] {
//        try await contractsCollection
//            .order(by: Contract.CodingKeys.rating.rawValue, descending: true)
//            .limit(to: count)
//            .start(after: [lastRating ?? 9999999])
//            .getDocuments(as: Contract.self)
//    }
//    
//    func getContractsByRating(count: Int, lastDocument: DocumentSnapshot?) async throws -> (contracts: [Contract], lastDocument: DocumentSnapshot?) {
//        if let lastDocument {
//            return try await contractsCollection
//                .order(by: Contract.CodingKeys.rating.rawValue, descending: true)
//                .limit(to: count)
//                .start(afterDocument: lastDocument)
//                .getDocumentsWithSnapshot(as: Contract.self)
//        } else {
//            return try await contractsCollection
//                .order(by: Contract.CodingKeys.rating.rawValue, descending: true)
//                .limit(to: count)
//                .getDocumentsWithSnapshot(as: Contract.self)
//        }
//    }
//    
//    func getAllContractsCount() async throws -> Int {
//        try await contractsCollection
//            .aggregateCount()
//    }
    
}

