enum CFDCategory {
    case finance, securities, economy, industrialBusiness, realEstate, hotnews
    
    var name: String {
        switch self {
        case .finance: "금융"
        case .securities: "증권"
        case .economy: "경제"
        case .industrialBusiness: "산업/재계"
        case .realEstate: "부동산"
        case .hotnews: "핫뉴스"   
        }
    }

}
