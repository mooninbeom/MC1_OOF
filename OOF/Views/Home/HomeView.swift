import SwiftUI




struct HomeView: View {
    @Environment(\.managedObjectContext) var managedObject
    @State var isBottomSheetPresented: Bool = false
    @State var isStartTripPresented: Bool = false
    @State var isAnimating: Bool = false
    @Binding var presentSideMenu: Bool
    
    @FetchRequest(
        entity: Trip.entity(),
        sortDescriptors: [.init(keyPath: \Trip.startDate, ascending: true)],
        predicate: NSPredicate(format: "%K > %@", #keyPath(Trip.endDate), Date() as NSDate))
    var fetchedData: FetchedResults<Trip>
    
    var body: some View {
        ZStack {
            VStack {
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
                    
                    
                    Circle()
                        .stroke(lineWidth: 3)
                        .frame(width: 35, height: 35)
                        .background( self.isAnimating ? .white : .clear)
                        .overlay {
                            if self.isAnimating {
                                Circle()
                                    .frame(width: 25, height: 25)
                                    .phaseAnimator([false, true]) { content, phase in
                                        content
                                            .foregroundStyle( phase ? .red : .black)
                                    } animation: { phase in
                                        if phase {
                                            return .easeOut(duration: 1)
                                        } else {
                                            return .easeIn(duration: 1)
                                        }
                                    }
                            }
                        }
                }
                .padding()
                
                Button {
                    isStartTripPresented.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.placeholder)
                        .frame(height: 150)
                        .padding(20)
                        .overlay {
                            Text("여행 start~")
                                .font(.system(size: 40, weight: .bold, design: .rounded))
                        }
                }
                
                HStack {
                    Text("등록된 여행")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: 100)
                    .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .foregroundStyle(.orange.opacity(0.5))
                    .overlay {
                        VStack {
                            ForEach(fetchedData) { trip in
                                HomeWillStartView(isAnimating: $isAnimating, trip: trip)
                            }
                        }
                    }
                
//                HStack {
//                    Circle()
//                        .stroke(lineWidth: 5)
//                        .frame(width: 50, height: 50)
//                        .background(.white)
//                        .overlay {
//                            Circle()
//                                .frame(width: 30, height: 30)
//                                .phaseAnimator([false, true], trigger: isAnimating) { content, phase in
//                                    content
//                                        .foregroundStyle( phase ? .red : .black)
//                                } animation: { phase in
//                                    if phase {
//                                        return .easeOut(duration: 1)
//                                    } else {
//                                        return .easeIn(duration: 1)
//                                    }
//                                }
//                        }
//                        .padding()
//                }
//                .padding()
                
                
                
                    

                
                
                Spacer()
                

                
                
                /*
                Rectangle()
                    .cornerRadius(30, corners: .topLeft)
                    .cornerRadius(30, corners: .topRight)
                    .foregroundStyle(.white)
                    .ignoresSafeArea()
                    .frame(height: 100)
                    .overlay {
                        Capsule()
                            .frame(width: 100, height: 10)
                            .foregroundStyle(.gray.opacity(0.7))
                    }
                    .gesture (
                        DragGesture()
                            .onEnded({ _ in
                                withAnimation {
                                    isBottomSheetPresented = true
                                }
                            })
                    )
                 */
                
                
            }
            
            /*
            if isBottomSheetPresented {
                BottomSheet($isBottomSheetPresented, height: 500) {
                    Text("hello~")
                }
                .frame(maxWidth: .infinity)
            }
             */
        }
        .background(.yellow.opacity(0.1))
        .ignoresSafeArea(edges: .bottom)
        .sheet(isPresented: $isStartTripPresented) {
            StartTripView(isPresented: $isStartTripPresented)
        }
    }
}







#Preview {
    let managedObject = PersistentController.shared.container.viewContext
    
    return HomeView(presentSideMenu: .constant(false))
        .environment(\.managedObjectContext, managedObject)
}





extension View {
    public func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    public var radius: CGFloat = .infinity
    public var corners: UIRectCorner = .allCorners
    
    init(radius: CGFloat, corners: UIRectCorner) {
        self.radius = radius
        self.corners = corners
    }
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: .init(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
