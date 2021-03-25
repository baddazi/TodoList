import SwiftUI

extension View {
    func onFirstAppear(perform: @escaping () -> Void) -> some View {
       modifier(OnFirstAppear(perform: perform))
    }
}

struct OnFirstAppear: ViewModifier {
    @State var referenceState = ReferenceState()
    final class ReferenceState {
        var hasAppeared: Bool = false
    }
    let perform: () -> Void
    func body(content: Content) -> some View {
        content
            .onAppear {
                if !referenceState.hasAppeared {
                    referenceState.hasAppeared = true
                    perform()
                }
            }
    }
}
