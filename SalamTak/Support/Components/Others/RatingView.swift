//
//  RatingView.swift
//  SalamTak
//
//  Created by Mohamed Hammam on 05/06/2022.
//

import Foundation
import SwiftUI

struct StarsView: View {
    private static let MAX_RATING: Float = 5 // Defines upper limit of the rating
    private static let COLOR = Color.salamtackWelcome // The color of the stars
    
    let rating: Float
    private let fullCount: Int
    private let emptyCount: Int
    private let halfFullCount: Int
    
    init(rating: Float) {
        self.rating = rating
        fullCount = Int(rating)
        emptyCount = Int(StarsView.MAX_RATING - rating)
        halfFullCount = (Float(fullCount + emptyCount) < StarsView.MAX_RATING) ? 1 : 0
    }
    
    var body: some View {
        HStack(spacing:0) {
            ForEach(0..<fullCount) { _ in
                self.fullStar
            }
            ForEach(0..<halfFullCount) { _ in
                self.halfFullStar
            }
            ForEach(0..<emptyCount) { _ in
                self.emptyStar
            }
        }
    }
    
    private var fullStar: some View {
        Image(systemName: "star.fill")
            .foregroundColor(StarsView.COLOR)
            .font(.system(size: 10))
    }
    
    private var halfFullStar: some View {
        Image(systemName: "star.lefthalf.fill")
            .foregroundColor(StarsView.COLOR)
            .font(.system(size: 10))
    }
    
    private var emptyStar: some View {
        Image(systemName: "star")
            .foregroundColor(StarsView.COLOR)
            .font(.system(size: 10))
    }
}
