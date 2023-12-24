import SwiftUI

struct UvIndexView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
               Text(Image(systemName: "sun.max.fill"))
                    .foregroundColor(Color.Theme().sectionHeaderColor)
                Text("UV-Index".uppercased())
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .foregroundColor(Color.Theme().sectionHeaderColor)
            }
            .shadow(radius: 2.0)
            
            Text("0")
                .font(.system(size: 36))
                .fontWeight(.regular)
                .foregroundColor(.white)
                .shadow(radius: 2.0)
            
            Text("Low")
                .font(.system(size: 20))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .shadow(radius: 2.0)
            
            Spacer()
            ProgressView(value: 0.0)
                .progressViewStyle(RangedProgressView(range: 0...1.0, foregroundColor: AnyShapeStyle(uvGradient), backgroundColor: .gray))
                .frame(maxHeight: 5.0)
            Spacer()
            Text("Use sun protetction 11AM-4PM.")
                .font(.system(size: 12))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .shadow(radius: 2.0)
                
        }
        .padding()
        .background {
            VisualEffectsView(effects: UIBlurEffect(style: .regular))
        }
        .cornerRadius(16.0)
    }
    
    var uvGradient: LinearGradient {
        return LinearGradient(colors: [.green, .yellow, .orange, .red, .purple], startPoint: .leading, endPoint: .trailing)
    }
}

struct UvIndexView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            HStack {
                UvIndexView()
                    .aspectRatio(1.0, contentMode: .fill)
//                UvIndexView()
//                    .aspectRatio(1.0, contentMode: .fill)
            }
        }
        .padding()
        .background(.black)
    }
}
