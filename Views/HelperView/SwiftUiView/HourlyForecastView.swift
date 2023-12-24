import SwiftUI

struct HourlyForecastView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Sunny condition will continue for the reast of the day. Wind gusts are up to 18 mph.")
                .font(.system(size: 12))
                .fontWeight(.medium)
                .shadow(radius: 2.0)
                .padding(.bottom, 6)
            
            Divider()
                .background(.white)
                .padding(.bottom, 10)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<23) { _ in
                        VStack {
                            Text("Now")
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .shadow(radius: 2.0)
                            
                            Image(systemName: "sun.max.fill")
                                .foregroundColor(.yellow)
                                .padding(.vertical, 4)
                            
                            Text("6°")
                                .font(.system(size: 20))
                                .fontWeight(.medium)
                                .shadow(radius: 2.0)
                        }
                        .padding(.trailing, 14)
                    }
                }
            }
            .scrollIndicators(ScrollIndicatorVisibility.hidden)
        }
        .padding(14)
        .foregroundColor(.white)
        .background {
            VisualEffectsView(effects: UIBlurEffect(style: .regular))
        }
        .cornerRadius(16.0)
    }
}

struct HourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            HourlyForecastView()
        }
        .padding()
        .background(.blue)
    }
}
