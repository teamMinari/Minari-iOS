import SwiftUI

public enum CFDTabItem: Int, CaseIterable {
    case tutorial = 0, news, home, quiz, profile
        
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
}
