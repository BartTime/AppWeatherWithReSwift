import SwiftUI

struct SunTrackerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "sunset.fill")
                    .foregroundColor(Color.Theme().sectionHeaderColor)
                    .shadow(radius: 1.0)
                Text("Sunset".uppercased())
                    .font(.system(size: 12))
                    .foregroundColor(Color(red: 0.54, green: 0.77, blue: 0.99))
                    .fontWeight(.medium)
            }
            .foregroundColor(.white.opacity(0.6))
            .shadow(radius: 2.0)
            .padding(.top, 15.0)
            .padding(.horizontal)
//            .padding(.bottom, 8.0)
            
            Text("6:45PM")
                .font(.system(size: 32))
                .fontWeight(.regular)
                .foregroundColor(.white)
                .shadow(radius: 1.0)
                .padding(.horizontal)
            
            Spacer()
            
            WaveView(dayColor: Color(red: 0.65, green: 0.77, blue: 0.89),
                     nightColor: Color(red: 0.28, green: 0.45, blue: 0.63),
                     sunColor: .white,
                     horizontColor: Color(red: 0.69, green: 0.78, blue: 0.88))

            
            Spacer()
            
            Text("Sunrise: 7:48 PM")
                .font(.system(size: 12))
                .fontWeight(.regular)
                .foregroundColor(.white)
                .shadow(radius: 1.0)
                .padding()
        }
        .background {
            VisualEffectsView(effects: UIBlurEffect(style: .regular))
        }
        .cornerRadius(16.0)
    }
}

struct SunTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            HStack {
                SunTrackerView()
                    .aspectRatio(1.0, contentMode: .fill)
                SunTrackerView()
                    .aspectRatio(1.0, contentMode: .fill)
            }
        }
        .padding()
        .background(.blue)
    }
}
