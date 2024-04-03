//
//  SelectTripNameView.swift
//  OOF
//
//  Created by 문인범 on 3/23/24.
//

import SwiftUI

struct SelectTripNameView: View {
    @Binding var selectedTripName: String
    @Binding var progressStatus: ProgressStatus
    @Binding var progress: Double
    
    var body: some View {
        VStack {
            Text("당신의 이번 여정")
                .font(.system(size: 30, weight: .bold, design: .rounded))
            
            Text("제목은 무엇인가요?")
                .font(.system(size: 30, weight: .bold, design: .rounded))


            // 글자제한 메소드 만들기
            TextField("10자 이내로 작성해주세요!", text: $selectedTripName)
                .padding()
                .textFieldStyle(.roundedBorder)
                .font(.system(size: 20, design: .rounded))
            
            HStack(spacing: 20) {
                Button {
                    withAnimation {
                        progressStatus = .selectInterval
                        progress = 0.4
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.red)
                        .frame(width: 100, height: 50)
                        .overlay {
                            Text("뒤로가기")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                        }
                }
                
                Button {
                    withAnimation {
                        self.progressStatus = .confirm
                        self.progress = 0.8
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 100, height: 50)
                        .overlay {
                            Text("완료")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                        }
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    SelectTripNameView(selectedTripName: .constant(""), progressStatus: .constant(.selectTripName), progress: .constant(0.8))
}
