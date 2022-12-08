//
//  SearchScreen.swift
//  StoreApp
//
//  Created by Gabriella Huegel on 11/10/22.
//

extension UIApplication {
      func dismissKeyboard() {
          sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
  }
 
import SwiftUI
 
struct SearchBar: View {
    @Binding var searchText: String
    @Binding var searching: Bool
     
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Gray"))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search...", text: $searchText) { startedEditing in
                     if startedEditing {
                         withAnimation {
                             searching = true
                         }
                     }
                 } onCommit: {
                     withAnimation {
                         searching = false
                     }
                 }
            }
            .foregroundColor(.gray)
            .padding(.leading, 13)
        }
            .frame(height: 40)
            .cornerRadius(13)
            .padding()
     }
 }
 
struct SearchScreen: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State var searchText = ""
    @State var searching = false
    
    let myClothes = [
        "Tank Top ", "T-Shirt ", "Jeans ", "Chinos ", "Skirt ", "Short Dress ", "Sweater ", "Hoodie ", "Sneakers ", "Dress Shoes "
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                SearchBar(searchText: $searchText, searching: $searching)
                List {
                    ForEach(myClothes.filter({ (item: String) -> Bool in
                        return item.hasPrefix(searchText) || searchText == ""
                    }), id: \.self) { item in
                        Text(item)
                    }
                }
                    .listStyle(GroupedListStyle())
                    .navigationTitle(searching ? "" : "Search Results")
                    .toolbar {
                        if searching {
                            Button("Cancel") {
                                searchText = ""
                                withAnimation {
                                    searching = false
                                    UIApplication.shared.dismissKeyboard()
                                }
                            }
                        }
                    }
                    .gesture(DragGesture()
                        .onChanged({ _ in
                            UIApplication.shared.dismissKeyboard()
                        })
                    )
            }
        }
    }
}
 
struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
