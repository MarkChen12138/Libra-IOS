////
////  ProductDetailViewModel.swift
////  LIBRA
////
////  Created by 好用的电脑 on 2023/10/29.
////
//
//import Foundation
//import Combine
//
//class ProductDetailViewModel: ObservableObject {
////    
////    @Published var overviewStatistics: [StatisticModel] = []
////    @Published var additionalStatistics: [StatisticModel] = []
//    @Published var productDescription: String? = nil
//    @Published var websiteURL: String? = nil
//    @Published var redditURL: String? = nil
//
//    @Published var product: Product
////    private let productDetailService: ProductDetailDataService
//    private var cancellables = Set<AnyCancellable>()
//    
//    init(product: Product) {
//        self.product = product
////        self.productDetailService = ProductDetailDataService(product: product)
//        self.addSubscribers()
//    }
//    
//    private func addSubscribers() {
//        
//        productDetailService.$productDetails
//            .combineLatest($product)
//            .map(mapDataToStatistics)
//            .sink { [weak self] (returnedArrays) in
//                self?.overviewStatistics = returnedArrays.overview
//                self?.additionalStatistics = returnedArrays.additional
//            }
//            .store(in: &cancellables)
//        
//        productDetailService.$productDetails
//            .sink { [weak self] (returnedProductDetails) in
//                self?.productDescription = returnedProductDetails?.readableDescription
//                self?.websiteURL = returnedProductDetails?.links?.homepage?.first
//                self?.redditURL = returnedProductDetails?.links?.subredditURL
//            }
//            .store(in: &cancellables)
//        
//    }
////    
////    
////    private func mapDataToStatistics(productDetailModel: ProductDetailModel?, productModel: ProductModel) -> (overview: [StatisticModel], additional: [StatisticModel]) {
////        let overviewArray = createOverviewArray(productModel: productModel)
////        let additionalArray = createAdditionalArray(productDetailModel: productDetailModel, productModel: productModel)
////        return (overviewArray, additionalArray)
////    }
////    
////    private func createOverviewArray(productModel: ProductModel) -> [StatisticModel] {
////        let price = productModel.currentPrice.asCurrencyWith6Decimals()
////        let pricePercentChange = productModel.priceChangePercentage24H
////        let priceStat = StatisticModel(title: "Current Price", value: price, percentageChange: pricePercentChange)
////        
////        let marketCap = "$" + (productModel.marketCap?.formattedWithAbbreviations() ?? "")
////        let marketCapPercentChange = productModel.marketCapChangePercentage24H
////        let marketCapStat = StatisticModel(title: "Market Capitalization", value: marketCap, percentageChange: marketCapPercentChange)
////        
////        let rank = "\(productModel.rank)"
////        let rankStat = StatisticModel(title: "Rank", value: rank)
////        
////        let volume = "$" + (productModel.totalVolume?.formattedWithAbbreviations() ?? "")
////        let volumeStat = StatisticModel(title: "Volume", value: volume)
////        
////        let overviewArray: [StatisticModel] = [
////            priceStat, marketCapStat, rankStat, volumeStat
////        ]
////        return overviewArray
////    }
////    
////    private func createAdditionalArray(productDetailModel: ProductDetailModel?, productModel: ProductModel) -> [StatisticModel] {
////        
////        let high = productModel.high24H?.asCurrencyWith6Decimals() ?? "n/a"
////        let highStat = StatisticModel(title: "24h High", value: high)
////        
////        let low = productModel.low24H?.asCurrencyWith6Decimals() ?? "n/a"
////        let lowStat = StatisticModel(title: "24h Low", value: low)
////        
////        let priceChange = productModel.priceChange24H?.asCurrencyWith6Decimals() ?? "n/a"
////        let pricePercentChange = productModel.priceChangePercentage24H
////        let priceChangeStat = StatisticModel(title: "24h Price Change", value: priceChange, percentageChange: pricePercentChange)
////        
////        let marketCapChange = "$" + (productModel.marketCapChange24H?.formattedWithAbbreviations() ?? "")
////        let marketCapPercentChange = productModel.marketCapChangePercentage24H
////        let marketCapChangeStat = StatisticModel(title: "24h Market Cap Change", value: marketCapChange, percentageChange: marketCapPercentChange)
////        
////        let blockTime = productDetailModel?.blockTimeInMinutes ?? 0
////        let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
////        let blockStat = StatisticModel(title: "Block Time", value: blockTimeString)
////        
////        let hashing = productDetailModel?.hashingAlgorithm ?? "n/a"
////        let hashingStat = StatisticModel(title: "Hashing Algorithm", value: hashing)
////        
////        let additionalArray: [StatisticModel] = [
////            highStat, lowStat, priceChangeStat, marketCapChangeStat, blockStat, hashingStat
////        ]
////        return additionalArray
////    }
////    
//}
//
