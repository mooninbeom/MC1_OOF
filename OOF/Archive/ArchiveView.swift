import SwiftUI


struct ArchiveView: View {
    @State var isPresented: Bool = false
    @Binding var isMenuViewPresent: Bool
    @Binding var isLogoButtonTapped: Int
    @Namespace var namespace
    
    let row = [ GridItem(.fixed(50))]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        isMenuViewPresent.toggle()
                    } label: {
                        Image(systemName: "book")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: 50, height: 50)
                    
                    Spacer()
                    
                    // 로고 나중에 이미지로 바꾸기 가능
                    Text("OOF")
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .foregroundStyle(.brown)
                        .onTapGesture {
                            isLogoButtonTapped = 0
                        }
                    
                    Color.clear
                        .frame(width: 50, height: 50)
                    Spacer()
                }
                .padding()
                
                ScrollView{
                    VStack {
                        HStack {
                            Text("여행 1")
                                .font(.system(size: 30, weight: .bold))
                            Spacer()
                        }
                        .padding()
                        
                        ScrollView(.horizontal){
                            
                            LazyHGrid(rows: row, spacing: 10) {
                                ForEach(0..<20) { _ in
                                    VStack {
                                        RoundedRectangle(cornerRadius: 10)
//                                            .matchedGeometryEffect(id: "image", in: namespace)
                                            .frame(width: 100, height: 100)
//                                            .foregroundStyle(.brown)
                                        
                                        Text("그냥저냥")
                                    }
                                    .padding()
                                    .onTapGesture {
                                        withAnimation {
                                            isPresented.toggle()
                                        }
                                    }
                                    .sheet(isPresented: $isPresented) {
                                        TripContentView()
                                            .ignoresSafeArea(.all)
                                    }
                                }
                            }
                        }
                        .frame(height: 150)
                        
                        HStack {
                            Text("여행 2")
                                .font(.system(size: 30, weight: .bold))
                            Spacer()
                        }
                        .padding()
                        
                        ScrollView(.horizontal){
                            LazyHGrid(rows: row, spacing: 10) {
                                ForEach(0..<20) { _ in
                                    VStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 100, height: 100)
                                        
                                        Text("그냥저냥")
                                    }
                                    .padding()
                                }
                            }
                        }
                        .frame(height: 150)
                        
                        HStack {
                            Text("여행 3")
                                .font(.system(size: 30, weight: .bold))
                            
                            Spacer()
                        }
                        .padding()
                        
                        ScrollView(.horizontal){
                            LazyHGrid(rows: row, spacing: 10) {
                                ForEach(0..<20) { _ in
                                    VStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 100, height: 100)
                                        
                                        Text("그냥저냥")
                                    }
                                    .padding()
                                }
                            }
                        }
                        .frame(height: 150)
                        HStack {
                            Text("여행 4")
                                .font(.system(size: 30, weight: .bold))
                            
                            Spacer()
                        }
                        .padding()
                        
                        ScrollView(.horizontal){
                            LazyHGrid(rows: row, spacing: 10) {
                                ForEach(0..<20) { _ in
                                    VStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 100, height: 100)
                                        
                                        Text("그냥저냥")
                                    }
                                    .padding()
                                }
                            }
                        }
                        .frame(height: 150)
                        
                        
                        HStack {
                            Text("여행 5")
                                .font(.system(size: 30, weight: .bold))
                            
                            Spacer()
                        }
                        .padding()
                        
                        ScrollView(.horizontal){
                            LazyHGrid(rows: row, spacing: 10) {
                                ForEach(0..<20) { _ in
                                    VStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 100, height: 100)
                                        
                                        Text("그냥저냥")
                                    }
                                    .padding()
                                }
                            }
                        }
                        .frame(height: 150)
                    }
                }
            }
            .background(Color.yellow.opacity(0.1))
        }
        .frame(width: .infinity, height: .infinity)
    }
}



#Preview {
    ArchiveView(isMenuViewPresent: .constant(false), isLogoButtonTapped: .constant(1))
}
