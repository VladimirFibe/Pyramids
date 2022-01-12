//
//  GameViewModel.swift
//  Pyramids
//
//  Created by Vladimir Fibe on 13.01.2022.
//

import Foundation

class GameViewModel: ObservableObject {
  var source: Int?
  @Published var pyramids = [
    Pyramid(colors: [1, 1, 2, 2]),
    Pyramid(colors: [2, 2, 1, 1]),
    Pyramid(colors: [])
  ]
  
  func move(from source: Int, to destination: Int) {
    guard let a = pyramids[source].colors.last else { return }
    if pyramids[destination].colors.isEmpty {
      pyramids[destination].colors = [a]
      pyramids[source].colors.removeLast()
    } else if let b = pyramids[destination].colors.last, a == b, pyramids[destination].colors.count < 4 {
      pyramids[destination].colors.append(a)
      pyramids[source].colors.removeLast()
    }
    pyramids.forEach { piramide in
      print(piramide)
    }
  }
  
  func touchPyramid(_ index: Int) {
    if let source = source {
      move(from: source, to: index)
      self.source = nil
    } else {
      source = index
    }
  }
}
