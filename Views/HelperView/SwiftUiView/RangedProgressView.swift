import SwiftUI

struct RangedProgressView: ProgressViewStyle {
    let range: ClosedRange<Double>
    let foregroundColor: AnyShapeStyle
    let backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        return GeometryReader { proxy in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(backgroundColor)
                
                Capsule()
                    .fill(foregroundColor)
                    .frame(width: proxy.size.width * fillWidthScale)
                    .offset(x: proxy.size.width * range.lowerBound)
                
                Circle()
                    .foregroundColor(backgroundColor)
                    .frame(width: proxy.size.height + 4.0, height: proxy.size.height + 4.0)
                    .position(x: proxy.size.width * (configuration.fractionCompleted ?? 0.0), y: proxy.size.height/2.0)
                
                Circle()
                    .foregroundColor(.white)
                    .frame(width: proxy.size.height + 2.0)
                    .position(x: proxy.size.width * (configuration.fractionCompleted ?? 0.0), y: proxy.size.height/2.0)
            }
            .clipped()
        }
    }
    
    var fillWidthScale: CGFloat {
        let normalizedRange = range.upperBound - range.lowerBound
        return Double(normalizedRange)
    }
}

struct RangedProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack {
                ForEach(0..<10) { value in
                    ProgressView(value: 0.5)
                        .frame(height: 10)
                        .progressViewStyle(RangedProgressView(range: 0.0...Double(value)/10.0, foregroundColor: AnyShapeStyle(LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing)), backgroundColor: .green))
                        .padding()
                }
                
                ForEach(0..<10) { value in
                    ProgressView(value: 0.5)
                        .frame(height: 10)
                        .progressViewStyle(RangedProgressView(range: Double(value)/10.0...1.0, foregroundColor: AnyShapeStyle(.yellow), backgroundColor: .green))
                                    .padding()
                }
                
                ProgressView(value: 0.5)
                    .frame(height: 10)
                    .progressViewStyle(RangedProgressView(range: 0.3...0.9, foregroundColor: AnyShapeStyle(.yellow), backgroundColor: .green))
                                .padding()
                
                ProgressView(value: 0.5)
                    .frame(height: 10)
                    .progressViewStyle(RangedProgressView(range: 0.1...0.6, foregroundColor: AnyShapeStyle(.yellow), backgroundColor: .green))
                                .padding()
                
                ProgressView(value: 0.5)
                    .frame(height: 10)
                    .progressViewStyle(RangedProgressView(range: 0.5...0.6, foregroundColor: AnyShapeStyle(.yellow), backgroundColor: .green))
                                .padding()
                
            }
        }
    }
}
