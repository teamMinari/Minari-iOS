import SwiftUI

private struct NumericAnimationModifier<V>: ViewModifier where V : BinaryInteger {
    private let value: V
    
    init(value: V) {
        self.value = value
    }
    
    func body(content: Content) -> some View {
        Group {
            if #available(iOS 17.0, *) {
                content
                    .contentTransition(.numericText(value: Double(value)))
            } else if #available(iOS 16.0, *) {
                content
                    .contentTransition(.numericText())
            } else {
                content
            }
        }
        .animation(.spring(response: 0.8, dampingFraction: 0.8), value: value)
    }
}
extension View {
    func numericAnimation<V>(_ value: V) -> some View where V : BinaryInteger {
        self.modifier(NumericAnimationModifier(value: value))
    }
}
