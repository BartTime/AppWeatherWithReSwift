import SwiftUI

struct BottomToolBar: View {
    @Binding var currentPage: Int
    @ObservedObject var storeObserver: StoreObserver
    
    var coordinator: MainCoordinator?
    
    var body: some View {
        VStack(alignment: .center) {
            Rectangle()
                .fill(Color(red: 0.29, green: 0.34, blue: 0.45))
                .frame(height: 1.5)
            Spacer()
            
            HStack(alignment: .center) {
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "magnifyingglass")
                })
                .padding(.leading, 30.0)
                .foregroundColor(.white)
                
                Spacer()
                
                PageControl(numberOfPages: 8, currentPage: $currentPage)
                    .frame(width: min(150, UIScreen.main.bounds.width - 60))
                
                Spacer()
                
                Button(action: {
                    MainStore.dispatch(ButtonShowAllCityRequestAction())
                }, label: {
                    Image(systemName: "list.bullet")
                })
                .padding(.trailing, 30.0)
                .foregroundColor(.white)
            }
            .onChange(of: MainStore.state.bottomBarState.isButtonAllCityTapped) { newValue in
                coordinator?.showDetail()
            }
        }
    }
}

struct BottomToolBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomToolBar(currentPage: .constant(5), storeObserver: StoreObserver(initialState: MainStore.state))
    }
}
