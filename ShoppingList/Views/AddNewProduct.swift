import SwiftUI

struct AddNewProduct: View {
    @State private var sheetHeight: CGFloat = .zero
    @State private var productName = ""
    @State private var productAmount = ""
    @State private var selectedCategory = ""
    let categories = ["Category A", "Category B", "Category C"]
    
    var body: some View {
        HStack {
            TextField("Name", text: $productName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Amount", text: $productAmount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Picker("Category", selection: $selectedCategory) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                }
            }            .padding()
            
            Spacer()
        }
        .frame(height: 200)
        .overlay {
            GeometryReader { geometry in
                Color.clear.preference(key: InnerHeightPreferenceKey.self, value: geometry.size.height)
            }
        }
        .onPreferenceChange(InnerHeightPreferenceKey.self) { newHeight in
            sheetHeight = newHeight
        }
        .presentationDetents([.height(sheetHeight)])
    }
}

struct InnerHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    AddNewProduct()
}
