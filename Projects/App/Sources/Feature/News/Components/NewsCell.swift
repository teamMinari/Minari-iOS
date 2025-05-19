import SwiftUI
import Kingfisher

struct NewsCell: View {
    
    let items: [NewsResponse]
    @Binding var selectedIndex: Int
    
    let dateFormatter = DateFormatter()

    
    init(items: [NewsResponse], selectedIndex: Binding<Int>) {
        self.items = items
        self._selectedIndex = selectedIndex
        
        dateFormatter.dateFormat = "yy.M.dd"
    }
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(0..<items.count, id: \.self) { index in
                let item = items[index]
                
                
                VStack(spacing: 0) {
                    
                    KFImage(URL(string: item.thumbnail ?? ""))
                        .placeholder {
                            CFDAsset.Gray.g100.swiftUIColor
                        }
                        .resizable()
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .clipShape(.rect(topLeadingRadius: 16, topTrailingRadius: 16))
                    
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(item.title)
                            .font(.pretendard(size: 18, weight: .semibold))
                            .lineLimit(2)
                            .foregroundStyle(CFDAsset.Gray.g800.swiftUIColor)
                        
                        HStack(spacing: 4) {
                            Text(dateFormatter.string(from: Date.now))
                            
                            Circle()
                                .frame(width: 2, height: 2)
                            
                            Text(item.uploadTime ?? "지금")
                        }
                        .font(.pretendard(size: 14))
                        .foregroundStyle(CFDAsset.Gray.g400.swiftUIColor)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .padding(.bottom, 2)
                    .background(Color.white.clipShape(.rect(bottomLeadingRadius: 16, bottomTrailingRadius: 16)))
                }
                .onTapGesture {
                    if let url = item.url {
                        NavigationManager.instance.present(next: SafariViewer(url: url))
                    }
                    
                }
            }
            
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: 300)
    }
}
