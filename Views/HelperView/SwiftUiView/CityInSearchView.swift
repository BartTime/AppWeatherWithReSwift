import SwiftUI

struct CityInSearchView: View {
    var body: some View {
        HStack() {
            Text("Москва Москва Москва Москва Москва Москва Москва Москва Москва Москва Москва ")
                .lineLimit(0)
                .foregroundColor(.white)
                .font(.system(size: 19))
                .fontWeight(.medium)
                .frame(alignment: .leading)
            Spacer()
        }
        .background(.black)
    }
}

struct CityInSearchView_Previews: PreviewProvider {
    static var previews: some View {
        CityInSearchView()
    }
}
