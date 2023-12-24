import SwiftUI

struct AirQualityView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "aqi.low")
                    
                Text("Air Quality".uppercased())
                    
            }
            .foregroundColor(Color.Theme().sectionHeaderColor)
            .font(Font.system(size: 12))
            .fontWeight(.medium)
            .shadow(color: .gray.opacity(0.6), radius: 1.0)
            .padding(.bottom, 5)
            
            Text("24 - Good")
                .foregroundColor(.white)
                .font(.system(size: 24))
                .fontWeight(.bold)
                .padding(.bottom, 5)
            
            Text("Air quality index is 24.")
                .foregroundColor(.white)
                .font(.system(size: 13))
                .fontWeight(.regular)
                .padding(.bottom, 16)
            
            ProgressView(value: 0)
                .progressViewStyle(RangedProgressView(range: 0...1.0, foregroundColor: AnyShapeStyle(uvGradient), backgroundColor: .gray))
                .frame(maxHeight: 5.0)
//                .padding(.bottom, 14)
                
        }
        .padding(16)
        .foregroundColor(.white)
        .background {
            VisualEffectsView(effects: UIBlurEffect(style: .regular))
        }
        .cornerRadius(16.0)
    }
    
    var uvGradient: LinearGradient {
        return LinearGradient(colors: [.green, .yellow, .orange, .red, .purple], startPoint: .leading, endPoint: .trailing)
    }
}

struct AirQualityView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            AirQualityView()
        }
        .background(.blue)
    }
}
