import SwiftUI




struct TripContentView: View {
    @State private var image: UIImage?
    @Binding var isPresented: Bool
    @Binding var record: Record?
    let namespace: Namespace.ID
    
    var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        return formatter
    }()
    
    var body: some View {
        ZStack {
            VStack {
                
                if let image = self.image {
                    Image(uiImage: image)
                        .clipShape(.circle)
                        .overlay {
                            Circle()
                                .fill(.white)
                                .frame(width: 14, height: 14)
                                .overlay {
                                    Circle()
                                        .fill(.orange)
                                        .frame(width: 10, height: 10)
                                    
                                }
                        }
                        .overlay {
                            Circle()
                                .stroke(lineWidth: 3)
                                .foregroundStyle(.brown)
                        }
                        .matchedGeometryEffect(id: "map", in: namespace)
                    
                    
                } else {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(width: 120, height: 120)
                }
                
                
                Text(record?.text ?? "비어있습니다!")
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                    .frame(height: 100)
                
                Text(formatter.string(from: record?.date ?? Date()))
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding()
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 10)
                    .padding(.init(top: 0, leading: 30, bottom: 50, trailing: 30))
                
                HStack(spacing: 70) {
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                    
                }
                
                
                Spacer()
            }
        }
        .onTapGesture {
            withAnimation {
                self.isPresented.toggle()
            }
        }
        .onAppear {
            generateSnapshot()
        }
    }
    
    private func generateSnapshot() {
        let snapshot = TripDAO.shared.makeMapSnapshot(lat: self.record!.lat, lng: self.record!.lng)
        
        snapshot.start { snapshot, error in
            if let error = error {
                print("지도 생성 오류: \(error.localizedDescription)")
                return
            }
            
            if let snapshot = snapshot {
                self.image = snapshot.image
            }
        }
    }
}


//#Preview {
//   
//}



