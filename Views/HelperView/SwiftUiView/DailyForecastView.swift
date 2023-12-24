import SwiftUI

struct DailyForecastView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(Color.Theme().sectionHeaderColor)
                Text("10-day forecast".uppercased())
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .foregroundColor(Color.Theme().sectionHeaderColor)
            }
            
            Divider()
                
            ForEach(0..<10) { _ in
                HStack {
                    Text("Today")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                    
                    Spacer()
                        .frame(maxWidth: 50)
                    
                    Text("6")
                        .foregroundColor(.white.opacity(0.6))
                    
                    let gradient = LinearGradient(colors: [
                        Color(red: 0.39, green: 0.8, blue: 0.74),
                        Color(red: 0.96, green: 0.8, blue: 0.0)
                    ],
                                                  startPoint: .leading,
                                                  endPoint: .trailing)
                    
                    ProgressView(value: 0.5)
                        .progressViewStyle(RangedProgressView(range: 0.2...0.8, foregroundColor: AnyShapeStyle(gradient), backgroundColor: Color(red: 0.25, green: 0.35, blue: 0.72).opacity(0.3)))
                        .frame(maxWidth: 100, maxHeight: 4.0)
                    
                    Text("9°")
                        .foregroundColor(.white)
                }
                
                Divider()
                    
            }
        }
        .padding(10)
        .background {
            VisualEffectsView(effects: UIBlurEffect(style: .regular))
        }
        .cornerRadius(16.0)
    }
}

struct DailyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            HStack {
                
                DailyForecastView()
                
            }
            .padding(.horizontal)
        }
        .background(.black)
    }
}
