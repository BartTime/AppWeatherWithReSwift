import SwiftUI

struct CityBlockView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Москва")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    Text("00:09")
                        .font(.system(size: 15))
                }
                Spacer()
                Text("5°")
                    .font(.system(size: 35))
                    .fontWeight(.medium)
            }
            Spacer()
            HStack {
                Text("Изморось")
                    .font(.system(size: 15))
                Spacer()
                Text("Макс.: 10°, мин.: 3°")
                    .font(.system(size: 15))
            }
        }
        .foregroundColor(.white)
        .padding()
//        .background(.black)
    }
}

struct CityBlockView_Previews: PreviewProvider {
    static var previews: some View {
        CityBlockView()
    }
}
