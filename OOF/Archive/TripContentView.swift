import SwiftUI




struct TripContentView: View {
    
    var body: some View {
        VStack {
            
            
            ContentMapView()
                .frame(maxHeight: 400)
                .padding()
            
            
            Text("사용자 지정 텍스트")
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .frame(height: 100)
            
            Text("언제 녹음되었는지 알려줌")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
//                .frame(height: 100)
                .padding()
            
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 10)
                .padding(.init(top: 0, leading: 30, bottom: 50, trailing: 30))

            HStack(spacing: 70) {
                Button {
                    
                } label: {
                    Image(systemName: "backward.end.alt.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "forward.end.alt.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
            }
            Spacer()
        }
    }
}


#Preview {
    TripContentView()
}



