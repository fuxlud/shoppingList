import SwiftUI

struct ShoppingList: View {
    
    @State private var isShowingSheet = false
    

    @State var gridData = [
        ["Product 1", "10", "Category A"],
        ["Product 2", "15", "Category B"],
        ["Product 3", "20", "Category A"],
        ["Product 4", "25", "Category C"]
    ]
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                Text("Name")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("Amount")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("Category")
                    .font(.headline)
                    .fontWeight(.bold)
                
                ForEach(gridData, id: \.self) { rowData in
                    Text(rowData[0])
                    Text(rowData[1])
                    Text(rowData[2])
                }
            }
            .padding()
                        
            Button(action: {
                            isShowingSheet = true
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 64))
                                .foregroundColor(.blue)
                                .padding()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            // Content of the sheet view
                            AddNewProduct()
                        }
        }
    }
}


#Preview {
    ShoppingList()
}
