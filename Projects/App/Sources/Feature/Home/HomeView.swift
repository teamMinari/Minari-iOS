import SwiftUI

struct HomeView: View {
    
    let recommendedText: [String] = ["추가경정예산", "인플레이션", "가상통화", "선불카드"]
    
    @EnvironmentObject var _rootVM: RootViewModel
    
    @EnvironmentObject var _homeVM: HomeViewModel
    @EnvironmentObject var _newsVM: NewsViewModel
    
    @FocusState var isFocused: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Color.white
                .frame(height: 40)
            
            HStack(spacing: 12) {
                if !isFocused {
                    CFDAsset.Icon.logo.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                        .foregroundStyle(CFDAsset.Primary.p500.swiftUIColor)
                        .onTapGesture {
                            if (_homeVM.isSearched) {
                                _homeVM.keywordReset()
                                _homeVM.isSearched = false
                            }
                        }
                }
                
                CFDSearchBar(isFocused: $isFocused, text: $_homeVM.keywordRequest.keyword) {
                    if !_homeVM.isSearchRemaining {
                        if !_homeVM.keywordRequest.keyword.isEmpty {
                            isFocused = true
                            
                            _homeVM.searchKeyword {
                                isFocused = false
                            }
                            
                        } else {
                            if _homeVM.isSearched {
                                _homeVM.isSearched = false
                            }
                        }
                    }
                }
             
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity) 
            .background(Color.white)
            
           
            
            ScrollView {
                
                if isFocused {
                    
                    VStack(spacing: 20) {
                        if let items = _homeVM.keywordResponses {
                            ForEach(items, id: \.self) { item in
                                HomeSearchButton(item.termNm) {
                                    _homeVM.getTermsById(id: item.termId) {
                                        isFocused = false
                                    }
                                }
                            }
                        } else {
                            ForEach(recommendedText, id: \.self) { text in
                                HomeSearchButton(text) {
                                    _homeVM.keywordRequest.keyword = text
                                }
                            }
                        }
                    }
                    .padding(20)
                    .background(Color.white)
                    .overlay {
                        GeometryReader { reader in
                            Rectangle()
                                .fill(CFDAsset.Gray.g200.swiftUIColor)
                                .frame(height: 1)
                                .position(x: reader.frame(in: .local).width / 2, y: reader.frame(in: .local).height)
                        }
                    }
                    
                    
                } else {
                    VStack {
                        Group {
                            if !_homeVM.isSearched {
                                HomeMainView()
                            } else {
                                HomeSearchView()
                            }
                            
                        }
                        .environmentObject(_rootVM)
                        
                        Spacer(minLength: 120)

                    }
                    .environmentObject(_homeVM)

                }
                
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(CFDAsset.Gray.g50.swiftUIColor)
        .onChange(of: isFocused) { value in
            _rootVM.isTabBarHidden = isFocused
            
            
            if _homeVM.isSearchRemaining {
                DispatchQueue.main.async {
                    isFocused = true
                }
            }
        }
        .onDisappear {
            _homeVM.keywordReset()
            _homeVM.isSearched = false
            _homeVM.keywordRequest.keyword = ""
        }
        .onAppear {
            _homeVM.keywordReset()
            _homeVM.isSearched = false
            
            if(_homeVM.todayTermResponses == nil) {
                _homeVM.getTodayTerm()
            }
            
            if(_newsVM.hotNewsList.isEmpty) {
                _newsVM.fetchHotnews()
            }
        }
        
    }
}
