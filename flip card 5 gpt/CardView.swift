//
//  CardView.swift
//  flip card 5 gpt
//
//  Created by Mirissa Wellalage　Tashmika Isuri on 2024/02/07.
//

import Foundation
import SwiftUI

struct CardView: View {
    @State private var isFlipped = false
//    @State private var shouldToggleBack = false
    let color: Color
    let selectedPickerColor: String
    let flippedCardIndex: Int

    var colors = [ 0: "Red",
                   1: "Blue",
                   2: "Green",
                   3: "Yellow",
                   4: "Orange",
                   5: "Purple"
    ]

    var body: some View {
        ZStack {
            Rectangle() 
                .foregroundColor(isFlipped ? color : Color.gray)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isFlipped.toggle()
//                        shouldToggleBack = true

                        // Schedule the toggle back after 2 seconds
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                            shouldToggleBack = false
                            isFlipped.toggle()
                        }
                    }
                }
                .frame(width: 80, height: 120) // Adjust size as needed

            if isFlipped && colors[flippedCardIndex] == selectedPickerColor {
                Text("Correct!" ) // Display something when the card is flipped, adjust as needed
                    .font(.headline)

            } else if isFlipped && colors[flippedCardIndex] != selectedPickerColor {
                Text("Try Again!" )  // Display something when the card is flipped, adjust as needed
                    .font(.headline)
            }
        }
    }
}
