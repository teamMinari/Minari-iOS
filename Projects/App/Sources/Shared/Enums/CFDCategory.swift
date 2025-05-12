import SwiftUI

enum CFDCategory {
    case finance, securities, economy, industrialBusiness, realEstate, hotnews
    
    var name: String {
        switch self {
        case .finance: "금융"
        case .securities: "증권"
        case .economy: "글로벌 경제"
        case .industrialBusiness: "산업/재계"
        case .realEstate: "부동산"
        case .hotnews: "핫뉴스"   
        }
    }
    
    var image: Image {
        switch self {
        case .finance: CFDAsset.Image.finance.swiftUIImage
        case .securities: CFDAsset.Image.securities.swiftUIImage
        case .economy: CFDAsset.Image.economy.swiftUIImage
        case .industrialBusiness: CFDAsset.Image.ib.swiftUIImage
        case .realEstate: CFDAsset.Image.estate.swiftUIImage
        default: .init(systemName: "questionmark")
        }
    }

}
