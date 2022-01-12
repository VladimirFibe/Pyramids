//
//  Game.swift
//  Pyramids
//
//  Created by Vladimir Fibe on 12.01.2022.
//

import Foundation

struct Pyramid: Identifiable {
  var id = UUID()
  var colors: [Int]
}

struct Game {
  
  var pyramids = [
    Pyramid(colors: [1, 1, 2, 2]),
    Pyramid(colors: [2, 2, 1, 1]),
    Pyramid(colors: [])
  ]
  
  mutating func move(from source: Int, to destination: Int) {
    guard let a = pyramids[source].colors.last else { return }
    if pyramids[destination].colors.isEmpty {
      pyramids[destination].colors = [a]
      pyramids[source].colors.removeLast()
    } else if let b = pyramids[destination].colors.last, a == b {
      pyramids[destination].colors.append(a)
      pyramids[source].colors.removeLast()
    }
  }
}
