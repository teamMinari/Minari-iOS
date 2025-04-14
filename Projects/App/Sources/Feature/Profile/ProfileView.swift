import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var _rootVM: RootViewModel

    
    var body: some View {
        VStack {
            Text("프로필")
            
            Button {
                _rootVM.isDebug = false
            } label: {
                Text("로그아웃")
            }
        }
    }
}

#Preview {
    ProfileView()
}
