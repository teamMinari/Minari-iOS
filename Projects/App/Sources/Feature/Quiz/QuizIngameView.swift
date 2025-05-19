import SwiftUI

struct QuizIngameView: View {
    
    @EnvironmentObject var _quizVM: QuizViewModel
    @EnvironmentObject var _rootVM: RootViewModel
    @EnvironmentObject var _profileVM: ProfileViewModel
    
    var body: some View {
        
        if _quizVM.isTotallyFinished {
            VStack(spacing: 32) {
                CFDAsset.Image.quizFriends.swiftUIImage
                
                VStack(spacing: 4) {
                    Text("대단해요!")
                        .font(.pretendard(size: 24, weight: .bold))
                        .foregroundStyle(CFDAsset.Gray.g900.swiftUIColor)
                    
                    Group {
                        Text("총 ")
                            .foregroundColor(CFDAsset.Gray.g900.swiftUIColor)
                        
                        +
                        
                        Text("\(_quizVM.answerCount)")
                            .foregroundColor(CFDAsset.Primary.p500.swiftUIColor)
                        +
                        
                        Text("문제를 맞췄어요!")
                            .foregroundColor(CFDAsset.Gray.g900.swiftUIColor)
                    }
                    .font(.pretendard(size: 20, weight: .medium))

                    
                    
                    
                }
                
                Spacer()
                    .frame(maxHeight: 60)
                
                RoundedRectangle(cornerRadius: 28)
                    .strokeBorder(CFDAsset.Primary.p300.swiftUIColor)
                    .frame(height: 60)
                    .overlay {
                        HStack(spacing: 2) {
                            Spacer()
                            
                            CFDAsset.Icon.ticket.swiftUIImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(CFDAsset.Primary.p900.swiftUIColor)
                                
                            
                            Text("My 포인트")
                                .font(.pretendard(size: 20, weight: .bold))
                                .foregroundStyle(CFDAsset.Primary.p900.swiftUIColor)
                            
                            Spacer()
                            
                            Text("\(_quizVM.lastPoint)P")
                                .font(.pretendard(size: 20, weight: .medium))
                                .foregroundStyle(CFDAsset.Primary.p600.swiftUIColor)
                                .numericAnimation(_quizVM.lastPoint)
                                .onAppear {
                                    _quizVM.lastPoint += _quizVM.addingPoint
                                }
                            
                            Spacer()
                        }
                    }
                
            }
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        _rootVM.paths.removeLast()
                        _quizVM.resetQuiz()
                    } label: {
                        CFDAsset.Icon.arrowLeft.swiftUIImage
                            .foregroundStyle(CFDAsset.Primary.p900.swiftUIColor)
                            .padding(8)
                    }
                }
                
            }
            .onReceive(_quizVM.$isFinished) { _ in
                if (_quizVM.isFinished) {
                    _profileVM.giveExp(exp: _quizVM.addingPoint / 10)
                    _profileVM.givePoint(point: _quizVM.addingPoint) {
                        _profileVM.getProfile()
                    }
                }
             }
            
            
        } else {
            VStack(alignment: .leading, spacing: 20) {
                
                Spacer()
                
                Text("\(_quizVM.quizIndex + 1)/\(_quizVM.quizs.isEmpty ? "?" : String(_quizVM.quizs.count))")
                    .font(.pretendard(size: 20, weight: .bold))
                    .foregroundStyle(CFDAsset.Primary.p600.swiftUIColor)
                
                Text(_quizVM.currentQuiz?.qtContents ?? "")
                    .font(.pretendard(size: 16, weight: .medium))
                    .lineLimit(nil)
                    .foregroundStyle(CFDAsset.Gray.g600.swiftUIColor)
                    .skeleton(_quizVM.quizs.isEmpty, shape: Rectangle())
                
                
                HStack(spacing: 0) {
                    QuizIngameButton(.no, isEnabled: _quizVM.selectedAnswer == .no) {
                        _quizVM.answer(false)
                    }
                    .disabled(_quizVM.isFinished)
                    
                    Spacer()
                    
                    QuizIngameButton(.yes, isEnabled: _quizVM.selectedAnswer == .yes) {
                        _quizVM.answer(true)
                    }
                    .disabled(_quizVM.isFinished)
                }
                
                
                VStack(alignment: .leading, spacing: 2) {
                    Button {
                        _quizVM.isShowingTip = true
                    } label: {
                        HStack(spacing: 2) {
                            CFDAsset.Image.sparkle.swiftUIImage
                            
                            Text(_quizVM.isFinished ? _quizVM.isAnswered ? "정답" : "오답" : "tip")
                                .font(.pretendard(size: 18, weight: .semibold))
                                .foregroundStyle(CFDAsset.Gray.g800.swiftUIColor)
                        }
                    }
                    .disabled(_quizVM.isFinished)
                    .skeleton(_quizVM.quizs.isEmpty, shape: Rectangle())
                    
                    Text(_quizVM.isFinished ? _quizVM.currentQuiz?.qtCmt ?? "" : _quizVM.isShowingTip ? _quizVM.currentQuiz?.qtTip ?? "" : "tip 아이콘 클릭 시 받게 되는 포인트가 줄어들게 됩니다.")
                        .font(.pretendard(size: 16, weight: .medium))
                        .foregroundStyle(CFDAsset.Gray.g700.swiftUIColor)
                        .skeleton(_quizVM.quizs.isEmpty, shape: Rectangle())
                }
                
                Spacer()
                
                if (_quizVM.isFinished) {
                    CFDBottomButton(
                        action: {
                            _quizVM.nextQuiz()
                        },
                        content: {
                            Text("다음")
                                .font(.pretendard(size: 16, weight: .semibold))
                                .foregroundColor(Color.white)
                        },
                        background: CFDAsset.Primary.p500.swiftUIColor.opacity(0.6)
                    )
                }
                
                Spacer()
            }
            .padding(.horizontal, 25)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .navigationBarBackButtonHidden()
        }
        
    }
}
