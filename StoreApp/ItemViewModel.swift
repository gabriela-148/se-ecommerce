//
//  ItemViewModel.swift
//  StoreApp
//
//  Created by Jordan on 12/8/22.
//
 
import Foundation
import FirebaseFirestore
 
class ItemViewModel: ObservableObject {
  @Published var items = [Item]()
  
  private var db = Firestore.firestore()
  
  func fetchData() {
    db.collection("Items").addSnapshotListener { (querySnapshot, error) in
      guard let documents = querySnapshot?.documents else {
        print("No documents")
        return
      }
 
      self.items = documents.map { queryDocumentSnapshot -> Item in
        let data = queryDocumentSnapshot.data()
        let name = data["name"] as? String ?? ""
        let price = data["price"] as? Int ?? 0
        let description = data["description"] as? String ?? ""
        let category = data["category"] as? String ?? ""
        let size = data["size"] as? String ?? ""
 
        return Item(name: name, price: price, description: description, category: category, size: size)
      }
    }
  }
}
