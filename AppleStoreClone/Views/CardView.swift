//
//  CardView.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 14/11/23.
//

import SwiftUI

struct CardView: View {
    
    @Environment(\.horizontalSizeClass) private var sizeClass
    @State private var isPresented = false
    @Environment(BackgroundLogic.self) private var sheetsPresented
    var card: Card
    
    var body: some View {
        
        if sizeClass == .compact{
            
            Button(action: {
                isPresented = true
                sheetsPresented.sheetIsPresented = isPresented
                
            }, label: {
                
                ZStack(alignment: .top){
                    Image(card.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .accessibilityHidden(true)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("NEW")
                                .font(.caption)
                                .foregroundStyle(card.textColor)
                                .opacity(0.7)
                            Text(card.title)
                                .foregroundStyle(card.textColor)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                        }
                        Spacer()
                    }
                    .padding()
                }
//                .overlay(alignment: .bottom) {
//                    BuyView(card: card)
//                        
//                }
            })
            .accessibilityLabel("Find out more about \(card.title)")
            
            // End of Button
            .buttonStyle(FlatButtonStyle())
            
            //Presents fullScreenCover with Details
            .fullScreenCover(isPresented: $isPresented,onDismiss: {
                isPresented = false
                sheetsPresented.sheetIsPresented = isPresented
            }, content: {
                FullScreenSheet(card: card)
            })
        }else{
            Button(action: {
                isPresented = true
                sheetsPresented.sheetIsPresented = isPresented
            }, label: {
                
                ZStack(alignment: .top){
                    Image(card.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("NEW")
                                .font(.caption)
                                .foregroundStyle(card.textColor)
                                .opacity(0.7)
                            Text(card.title)
                                .foregroundStyle(card.textColor)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                        }
                        Spacer()
                    }
                    .padding()
                }
                .overlay(alignment: .bottom) {
                    BuyView(card: card)
                }
            })
            .accessibilityLabel("Find out more about \(card.title)")
            .buttonStyle(FlatButtonStyle())
            
            //Presents fullScreenCover with Details
            .fullScreenCover(isPresented: $isPresented,onDismiss: {
                isPresented = false
                sheetsPresented.sheetIsPresented = isPresented
            }, content: {
                FullScreenSheet(card: card)
            })
        }
    }
}


#Preview {
    CardView(card: Card(imageName: "TV", title: "Television", price: 499, description: "LOL", textColor: .white, iPadImageName: "TVIPAD", objectName: "TV"))
        .environment(BackgroundLogic())
    
}

//Overlay on the bottom
struct BuyView: View {
    
    var card : Card
    
    var body: some View {
        ZStack {
//            Rectangle()
//                .foregroundStyle(.white)
//                .frame(height: 70)
            HStack {
                Text("From $\(card.price, specifier: "%.0f") or $\(card.price/24, specifier: "%.2f")/mo. for 24 mo.*")
                    .accessibilityLabel("From $\(card.price, specifier: "%.0f") or $\(card.price/24, specifier: "%.2f") per month for 24 months *")
                    .font(.caption)
                    .foregroundStyle(.black)
                    
                Spacer()
                Button(action: {}, label: {
                    Text("BUY")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.black)
                            .opacity(0.05))
                    
                })
            }
            
            .padding()
            .background(.white)
            
        }
    }
}

//Button Style that removes the click animation
struct FlatButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
