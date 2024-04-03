import SwiftUI





struct HomeArchiveModalView: View {
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(.yellow.opacity(0.2))
                    
                    ScrollView {
                        VStack {
                            Capsule()
                                .frame(width: 80, height: 5)
                                .foregroundStyle(.gray)
                                .padding()
                            
                            Spacer()
                            
                            HStack(spacing: 20) {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(height: 300)
                                RoundedRectangle(cornerRadius: 20)
                                
                            }
                            .padding(20)
                            
                            HStack(spacing: 20) {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(height: 300)

                                RoundedRectangle(cornerRadius: 20)
                            }
                            .padding(20)
                            HStack(spacing: 20) {
                                RoundedRectangle(cornerRadius: 20)
                                RoundedRectangle(cornerRadius: 20)
                            }
                            .padding(20)
                            HStack(spacing: 20) {
                                RoundedRectangle(cornerRadius: 20)
                                RoundedRectangle(cornerRadius: 20)
                            }
                            .padding(20)
                        }
                    }
                }
                
                
                Spacer()
            }
        }
        .frame(width: .infinity, height: .infinity)
        .background(.clear)
    }
}




struct BottomSheet<Content>: View where Content: View {
    
    @Binding var isPresented: Bool
    var height: CGFloat
    var content: Content
    
    @GestureState private var translation: CGFloat = .zero
    
    init(_ isPresented: Binding<Bool>, height: CGFloat, content: () -> Content) {
        self._isPresented = isPresented
        self.height = height
        self.content = content()
    }
    
    
    var body: some View {
        VStack {
            
            RoundedRectangle(cornerRadius: 100)
                .fill(.white)
                .frame(height: 70)
                .overlay {
                    Capsule()
                        .foregroundStyle(.gray)
                        .frame(width: 100, height: 10)
                }
            
            self.content
                .frame(height: self.height)
        }
        .frame(height: self.height + 30)
        .background {
            Rectangle()
                .fill(.white)
                .ignoresSafeArea(edges: [.bottom, .horizontal])
                .offset(y: 10)
        }
        .transition(.opacity.combined(with: .move(edge: .bottom)))
        .offset(y: translation+300)
        .gesture(
            DragGesture()
                .updating($translation) { value, state, _ in
                    if 0 <= value.translation.height {
                        let translation = min(self.height, max(-self.height, value.translation.height))
                        state = translation
//                        state = 300
                    }
                }
                .onEnded({ value in
                    if value.translation.height >= height/3 {
                        withAnimation(.interactiveSpring) {
                            self.isPresented = false
                        }
                    }
                })
        )
        
    }
}



#Preview {
    BottomSheet(.constant(true), height: 300) {
        Text("test")
    }
}
