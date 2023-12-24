import SwiftUI

struct ContentView: View {
    @ObservedObject var storeObserver: StoreObserver
    @State private var currentPage = 0
    

    var coordinator: MainCoordinator?
    
    var body: some View {
        NavigationView {
            TabView(selection: $currentPage) {
                MainSwiftUIView(storeObserver: storeObserver).tag(0)
                MainSwiftUIView(storeObserver: storeObserver).tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .padding(.bottom, 30)

            .overlay(alignment: .bottom, content: {
                BottomToolBar(currentPage: self.$currentPage, storeObserver: storeObserver, coordinator: self.coordinator)
                    .frame(height: 30)
                    .background(.clear.opacity(0.6))
            })

            .navigationBarHidden(true)

            .background(backgroundStyle)


        }
        .ignoresSafeArea(.all)
        
    }
    
    var backgroundStyle: some ShapeStyle {
        return LinearGradient(
            colors: Color.Theme().darkGradientsColor,
            startPoint: .top,
            endPoint: .bottom)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(storeObserver: StoreObserver(initialState: MainStore.state))
    }
}
