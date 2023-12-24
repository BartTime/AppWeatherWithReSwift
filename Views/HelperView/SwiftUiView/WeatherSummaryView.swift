import SwiftUI

struct WeatherSummaryView: View {
    var body: some View {
        VStack {
            Text("Moscow")
                .font(.system(size: 32))
            Text("6°")
                .font(.system(size: 100))
                .fontWeight(.thin)
            Text("Mostly Sunny")
                .font(.system(size: 18))
                .fontWeight(.medium)
            Text("H: 9°, L: 3°")
                .font(.system(size: 18))
                .fontWeight(.medium)
               
        }
        .shadow(radius: 2.0)
        .foregroundColor(.white)
    }
}

struct WeatherSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            HStack {
                Spacer()
                WeatherSummaryView()
                Spacer()
            }.padding(.top, 60)
        }
        .background(.blue)
    }
}
