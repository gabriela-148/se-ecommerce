//
//  HomeScreen.swift
//  StoreApp
//  UI for the HomeScreen
//
//
 
import SwiftUI
 
struct HomeScreen: View {
    @EnvironmentObject var viewModel : AppViewModel
    
    let screenName: String
    let shirt: Item
    let shirtHome = Item(name: "Mens Button Up Shirt", price: 45, description: "A versatile shirt, perfect for work and any special occassion.", category: "Mens", size: "S, M, L, XL")
    let shirtHomeW = Item(name: "Womens Puffy Sleeved Shirt", price: 50, description: "Elevate your outfit with this stylish shirt.", category: "Womens", size: "S, M, L, XL")
   // let shoes: Item
    var body: some View {
        NavigationView {
            
            VStack{
                //NavigationView {
                Spacer()
                Text("DressCode")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    
                    
                    Text("New Arrivals")
                    Image("NewArrivalPic")
                        .resizable()
                        .frame(width: 370.0, height: 100)
                    
                    
                    //Spacer()
                    
                    
                //Text("Take A Look At Our new Mens Button Up Shirt")
                  //  .font(.headline)
                    //.padding(.all)
                        
                    Text("Take A Look At Our new Mens Button Up Shirt")
                        .font(.headline)
                        .padding(.all)
                        NavigationLink(destination: ItemDetail(itemDetail: shirtHome)) {
                            VStack {
                                Image(shirtHome.mainImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100.0, height: 100.0)
                                Text(shirtHome.name)
                                Text("$\(shirtHome.price)")
                            }
                        }
                    
                    
                    .navigationTitle("shirts")
                    
                    
                    
                    
                    
                    //   Text("Take A Look At Our New Puffy Sleeved Shirt for womens")
                    //     .font(.headline)
                    //       .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    
                    
                    Text("Take A Look At Our New Puffy Sleeved Shirt for womens")
                        .font(.headline)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
                        NavigationLink(destination: ItemDetail(itemDetail: shirtHomeW)){
                            VStack{
                                Image(shirtHomeW.mainImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100.0, height: 100.0)
                                
                                Text(shirtHomeW.name)
                                Text("$\(shirt.price)")
                            }
                        }
                        .frame(width: 0.0)
                
                    }
                
                .navigationTitle("shirts")
                
                
                    //Image("Womens Puffy Sleeved Shirt")
                      //  .resizable()
                       // .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    
                    //Spacer()
                    
                
                
                VStack {
                    
                    
                    Text(screenName)
                    
                        .frame(height: 1.0)
                    
                    
                    
                }
                
            }
            //.navigationBarTitle(screenName)
            
        }
    }
//}
 
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(screenName: "Home" , shirt:Item.example)
        
    }
}
