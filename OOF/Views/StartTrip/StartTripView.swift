import SwiftUI




struct StartTripView: View {
    @State private var selectedStartDate: Date = Date()
    @State private var selectedEndDate: Date = Date()
    @State private var isStartDateSelected: Bool = false
    @State private var isTripConfirmed: Bool = false
    @State private var progress: Double = 0
    @State private var progressStatus: ProgressStatus = .selectStartDate
    @State private var hourValue: Int = 1
    @State private var secondValue: Int = 15
    @State private var selectedTripName: String = ""
    
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            ProgressView(value: progress)
            
            ZStack {
                switch progressStatus {
                case .selectStartDate, .selectEndDate:
                    DateSelectView(progressStatus: $progressStatus, selectedStartDate: $selectedStartDate, selectedEndDate: $selectedEndDate, progress: $progress)
                case .selectInterval:
                    TimeIntervalView(progressStatus: $progressStatus, progress: $progress, hourValue: $hourValue, secondValue: $secondValue)
                case .selectTripName:
                    SelectTripNameView(selectedTripName: $selectedTripName, progressStatus: $progressStatus, progress: $progress)
                case .confirm:
                    ConfirmTripView(progressStatus: $progressStatus, progress: $progress, selectedStartDate: self.selectedStartDate, selectedEndDate: self.selectedEndDate, hourValue: self.hourValue, secondValue: self.secondValue, selectedTripName: self.selectedTripName)
                case .success:
                    TripSuccessView(isPresented: $isPresented, progressStatus: $progressStatus, progress: $progress, isTripConfirmed: $isTripConfirmed)
                }
                
            }
            .navigationTitle(getNavigationTitle(progressStatus))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "arrow.down.right.and.arrow.up.left")
                    }
                }
            }
            .onDisappear {
                if isTripConfirmed {
                    TripDAO.shared.tripComfirm(startDate: selectedStartDate, endDate: selectedEndDate, interval: hourValue, recordLength: secondValue, tripName: selectedTripName)
                }
            }

        }
    }
    
    private func getNavigationTitle(_ status: ProgressStatus) -> String {
        switch status {
        case .selectStartDate, .selectEndDate:
            return "여행 기간은 얼마나 되시나요?"
        case .selectInterval:
            return "어떻게 기록을 진행할까요?"
        case .selectTripName:
            return "여행 이름을 정해주세요!"
        case .confirm:
            return "여행 정보를 확인해주세요!"
        case .success:
            return "여행을 준비하세요!"
        }
    }
}

enum ProgressStatus {
    case selectStartDate
    case selectEndDate
    case selectInterval
    case selectTripName
    case confirm
    case success
}


#Preview {
    StartTripView(isPresented: .constant(true))
}




