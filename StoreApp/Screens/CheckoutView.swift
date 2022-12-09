//
//  CheckoutView.swift
//  StoreApp
//  displays the total of a customers cart and collects payment method
//  Created by lauren boyle on 12/4/22.
//

import FirebaseAuth
import SwiftUI
import FirebaseCore
import Firebase
import FirebaseFirestore

struct CheckoutView: View {
    //@EnvironmentObject var order: Order
    @EnvironmentObject var viewModel: AppViewModel
    
    @State private var paymentType = "Credit Card"
    @State private var showingPaymentAlert = false
    //@State private var addCardInfo = false
    @State private var creditCardNumber = "Card Number"
    @State private var cardHolder = "Name"
    @State private var expirationDate = "Expiration Date"
    @State private var cvv = "CVV"
    
    let db = Firestore.firestore()
    var userEmail = Auth.auth().currentUser?.email
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(viewModel.total)
        
        return formatter.string(from: NSNumber(value: total)) ?? "$0"
    }
    
    let paymentTypes = ["Credit Card", "PayPal", "Apple Pay", "Dress Code Reward Points"]
    var body: some View {
        Form {
            Section {
                Picker("Select payment type", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
            }
            
            Section(header: Text("TOTAL: \(totalPrice)")
                        .font(.largeTitle)
                        .fontWeight(.black)) {
                if (paymentType == "Credit Card") {
                    TextField("Card Number", text: $creditCardNumber)
                    TextField("Name", text: $cardHolder)
                    TextField("Expiration Date", text: $expirationDate)
                    TextField("CVV", text: $cvv)
                    Text(userEmail ?? "example@gmail.com")
                } else {
                    TextField("Name", text: $cardHolder)
                    Text(userEmail ?? "example@gmail.com")
                }
                Button("Confirm order") {
                    showingPaymentAlert.toggle()
                    viewModel.saveOrder(customer: userEmail ?? cardHolder, totalPrice: totalPrice, paymentType: paymentType)
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order Confirmed"), message: Text("Your total was \(totalPrice)"), dismissButton: .default(Text("OK")))
        }
    }
    
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(AppViewModel())
    }
}
