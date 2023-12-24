import SwiftUI
import ReSwift

struct MainSwiftUIView: View {
    @ObservedObject var storeObserver: StoreObserver
    @State var showAllert = false
    @State var error: NetworkError?
    
    var body: some View {
        ScrollView {
            VStack {
                WeatherSummaryView()
                    .padding(.top, 60)
                    .padding(.bottom, 40)

                HourlyForecastView()

                DailyForecastView()

                AirQualityView()

                HStack {
                    UvIndexView()
                        .aspectRatio(1.0, contentMode: .fill)

                    SunTrackerView()
                        .aspectRatio(1.0, contentMode: .fill)
                }
                .alert(isPresented: $showAllert) {
                    return Alert(
                        title: Text("Ошибка"),
                        message: Text(error!.localizedDescription),
                        dismissButton: .default(
                            Text("OK")) {
                                MainStore.dispatch(ApiRequestActionDeleteError())
                            }
                    )
                }
            }
            .onChange(of: MainStore.state) { newValue in
                if let value = newValue?.getApiDataState.apiData {
                    if MainStore.state.getReceiveDataState.data == nil {
                        MainStore.dispatch(ReceiveDataRequestAction(data: value))
                    }
                }

                if let value = newValue?.getApiDataState.networkError {
                    showAllert.toggle()
                    error = value
                }

                if let value = newValue?.getReceiveDataState.data {
                    print("yes data isHere \(value.cityName) \(value.tempMaxNow)")
                }
            }
            .padding(.horizontal)
        }
        .refreshable {
            MainStore.dispatch(ApiRequestAction())
        }
        .background(backgroundStyle)
        .ignoresSafeArea(.all)
    }
    
    
    var backgroundStyle: some ShapeStyle {
        return LinearGradient(
            colors: Color.Theme().darkGradientsColor,
            startPoint: .top,
            endPoint: .bottom)
    }
}



struct MainSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainSwiftUIView(storeObserver: StoreObserver(initialState: MainStore.state))
    }
}
