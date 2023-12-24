import SwiftUI

struct AllCityContentView: View {
    @State private var searchText = ""
    @State private var isSearching = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                if !isSearching {
                    ForEach(0..<10) { _ in
                        CityBlockView()
                            .background(backgroundStyle)
                            .cornerRadius(15.0)
                    }
                } else {
                    ForEach(0..<10) { _ in
                        VStack {
                            CityInSearchView()
                            Divider()
                        }
                        
                    }
                }
            }
            .padding()
            .searchable(text: $searchText) {
                
            }
            .navigationTitle("Погода")
            .navigationBarItems(trailing: Button(action: {
                
            }, label: {
                Image(systemName: "pencil")
            })
                .foregroundColor(.white)
            )
        }.onChange(of: searchText) { newValue in
            isSearching = !searchText.isEmpty
        }
    }
    
    var backgroundStyle: some ShapeStyle {
        return LinearGradient(
            colors: Color.Theme().darkGradientsColor,
            startPoint: .top,
            endPoint: .bottom)
    }
}

struct AllCityContentView_Previews: PreviewProvider {
    static var previews: some View {
        AllCityContentView()
    }
}
