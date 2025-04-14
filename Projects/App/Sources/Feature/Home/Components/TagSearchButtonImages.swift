import SwiftUI

struct TagSearchButtonImages {
    static func get(category: CFDCategory) -> Image {
        switch category {
        case .finance: CFDAsset.Image.finance.swiftUIImage
        case .securities: CFDAsset.Image.securities.swiftUIImage
        case .economy: CFDAsset.Image.economy.swiftUIImage
        case .industrialBusiness: CFDAsset.Image.ib.swiftUIImage
        case .realEstate: CFDAsset.Image.estate.swiftUIImage
        default: .init(systemName: "questionmark")

        }
    }
        
}
