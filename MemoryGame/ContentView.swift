//
//  ContentView.swift
//  MemoryGame
//
//  Created by Sravani Gudiguntla on 5/6/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚗","🚕","🚙","🚌", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🛵", "🚲", "🦼", "🛴", "🏍", "🚔", "🚍", "🚘", "🚡", "✈️"]
    @State var emojiCount = 6
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(title: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            HStack {
                plusButton
                Spacer()
                minusButton
            }.font(.largeTitle)
        }.padding(.horizontal)
    }
    var plusButton: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    var minusButton: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
}

struct CardView: View {
    var title: String
    @State var isFaceUp = false
    var shape = RoundedRectangle(cornerRadius: 20)
    var body: some View {
        ZStack {
            if isFaceUp {
                shape.fill(.white)
                Text(title)
                shape.strokeBorder(lineWidth: 2)
                    .foregroundColor(.red)
            } else {
                Text(title)
                shape.fill(.red)
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
        .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
