import SwiftUI



struct SideMenu: View {
    @Binding var isShowing: Bool
    var content: AnyView
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                Color.clear
                    .ignoresSafeArea()
                    .background(.ultraThinMaterial)
                    .onTapGesture {
                        isShowing = false
                    }
                
                content
                    .transition(.move(edge: .leading))
                    .background(.clear)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.spring, value: isShowing)
    }
}



enum SideMenuRowType: Int, CaseIterable {
    case home = 0
    case archive
    case register
    case share
    
    
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .archive:
            return "보관함"
        case .register:
            return "등록함"
        case .share:
            return "공유 기록"
        }
    }
    
    var image: String {
        switch self {
        case .home:
            return "house"
        case .archive:
            return "archivebox"
        case .register:
            return "moon.haze.circle"
        case .share:
            return "square.and.arrow.up.circle"
        }
    }
}


struct SideMenuView: View {
    @Binding var selectedSideMenuTab: Int
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
//                    .fill(.yellow.opacity(0.1))
                    .foregroundStyle(.yellow.opacity(0.1))
                    .frame(width: 270)
                    .shadow(color: .orange.opacity(0.1), radius: 5, x: 0, y: 3)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    ProfileImageView()
                        .frame(height: 140)
                        .padding(.bottom, 50)
                        .padding(.top, 100)
                    
                    ForEach(SideMenuRowType.allCases, id: \.self) { item in
                        Button {
                            selectedSideMenuTab = item.rawValue
                            presentSideMenu.toggle()
                        } label: {
                            VStack(alignment: .leading) {
                                HStack {
                                    Rectangle()
                                        .fill(selectedSideMenuTab == item.rawValue ? .orange : .white)
                                        .frame(width: 5)
                                    
                                    ZStack {
                                        Image(systemName: item.image)
                                            .resizable()
                                            .renderingMode(.template)
                                            .foregroundStyle(selectedSideMenuTab == item.rawValue ? .black : .gray)
                                            .frame(width: 26, height: 26)
                                    }
                                    .frame(width: 30, height: 30)
                                    
                                    Text(item.title)
                                        .foregroundStyle(selectedSideMenuTab == item.rawValue ? .black : .gray)
                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                                    Spacer()
                                }
                                .background(.yellow.opacity(0.1))
                                .frame(width: 270)
                            }
                        }
                        .frame(height: 50)
                        .background(LinearGradient(colors: [selectedSideMenuTab == item.rawValue ? .orange.opacity(0.5) : .white, .white], startPoint: .leading, endPoint: .trailing))
                    }
                    
                    Spacer()
                }
                    
            }
            .frame(width: 270)

            Spacer()
        }
    }
    
    
    func ProfileImageView() -> some View {
        VStack(alignment: .center){
            HStack{
                Spacer()
                Image("IMG_0092")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(.orange.opacity(0.5), lineWidth: 10)
                    )
                    .clipShape(.circle)
                Spacer()
            }
            
            Text("무니무니")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
            
            Text("지상최고개발자")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black.opacity(0.5))
        }
    }
}



#Preview {
    SideMenuView(selectedSideMenuTab: .constant(2), presentSideMenu: .constant(true))
}
