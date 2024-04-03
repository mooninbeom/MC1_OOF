import SwiftUI





struct TopLogoView: View {
    @Binding var presentSideMenu: Bool
    
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
                presentSideMenu.toggle()
            } label: {
                Image(systemName: "book.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(width: 35, height: 35)
            
            Spacer()
            
            // 로고 나중에 이미지로 바꾸기 가능
            Text("OOF")
                .font(.system(size: 45, weight: .bold, design: .rounded))
                .foregroundStyle(.brown)
            
            Spacer()
            
            Color.clear
                .frame(width: 35, height: 35)
//            Spacer()
            
        }
        .padding()
    }
}
