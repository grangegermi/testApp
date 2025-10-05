//
//  TrashView.swift
//  TestApp
//
//  Created by Даша Суворова on 5.10.25.
//

import SwiftUI
import SwiftData

struct TrashView: View {
    var dataService = DataService()
    @Query(sort: \CartProduct.title) private var cartItems: [CartProduct]
    @Environment(\.modelContext) var modelContext
    private var totalPrice: Double {
        cartItems.reduce(0) { $0 + $1.price * Double($1.quantity) }
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.appBackround.ignoresSafeArea()
                List(cartItems){ cart in
                    HStack{
                        VStack(alignment: .leading){
                            HStack {
                                Text(cart.title)
                                Text("Quantity: \(cart.quantity)")
                            }
                            Text(String(format: "%.2f$", cart.price))
                        }
                        Spacer()
                        HStack {
                            Button {
                                dataService.deleteFromCart(product: cart, context: modelContext)
                            } label: {
                                Image(systemName: "minus")
                                    .tint(Color.black)
                            }
                            .buttonStyle(.plain)
                            Button {
                                dataService.addToCart(product: ModelProducts(id: cart.idCart,
                                                                             title: cart.title,
                                                                             price: cart.price,
                                                                             description: "",
                                                                             image: "",
                                                                             category: "",
                                                                             rating: Rating(rate: 0.0, count: 0)),
                                                      context: modelContext)
                            } label: {
                                Image(systemName: "plus")
                                    .tint(Color.black)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .listRowBackground(Color.clear)
                HStack{
                    Text("Total price: \(String(format: "%.2f$", totalPrice))")
                    Button {
                        dataService.deleteAllCart(context: modelContext)
                    } label: {
                        Text("Delete all")
                            .font(Font.system(size: 18, weight: .bold))
                    }
                }
                .font(Font.system(size: 20, weight: .bold))
            }
            .listStyle(.plain)
            .navigationTitle("Cart")
        }
    }
}


#Preview {
    TrashView()
}
