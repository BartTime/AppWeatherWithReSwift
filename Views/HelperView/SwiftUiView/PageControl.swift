import SwiftUI

struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(0..<numberOfPages) { page in
                    Circle()
                        .fill(page == currentPage ? Color.white : Color(red: 0.53, green: 0.58, blue: 0.65))
                        .frame(width: 8, height: 8)
                        .onTapGesture {
                            currentPage = page
                        }
                }
            }
            .padding(8)
        }
    }
}
