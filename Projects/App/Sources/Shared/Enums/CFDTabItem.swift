import SwiftUI

public enum CFDTabItem: Int, CaseIterable {
    case tutorial = 0, news, home, quiz, profile
    
    var name: String {
        switch self {
        case .tutorial: "튜토리얼"
        case .news: "뉴스"
        case .home: "홈"
        case .quiz: "퀴즈"
        case .profile: "마이"
        }
    }
    
    var icon: Image {
        switch self {
        case .home:
            CFDAsset.Icon.home.swiftUIImage
        case .tutorial:
            CFDAsset.Icon.tutorial.swiftUIImage
        case .news:
            CFDAsset.Icon.news.swiftUIImage
        case .quiz:
            CFDAsset.Icon.quiz.swiftUIImage
        case .profile:
            CFDAsset.Icon.profile.swiftUIImage
        }
    }
    
    var iconFill: Image {
        
        switch self {
        case .home:
            CFDAsset.Icon.homeFill.swiftUIImage
        case .tutorial:
            CFDAsset.Icon.tutorialFill.swiftUIImage
        case .news:
            CFDAsset.Icon.newsFill.swiftUIImage
        case .profile:
            CFDAsset.Icon.profileFill.swiftUIImage
        default:
            icon

        }
    }
    
    
}
