//
//  ContentView.swift
//  Shared
//
//  Created by Vladimir Fibe on 12.01.2022.
//

import SwiftUI

struct ContentView: View {
  @StateObject var viewModel = GameViewModel()
    var body: some View {
      VStack {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 50) {
          ForEach(viewModel.pyramids.indices, id: \.self) { i in
            let pyramid = viewModel.pyramids[i]
            VStack(spacing: 0) {
              Spacer(minLength: 0)
              if pyramid.colors.count > 0 {
                
                ForEach((0..<pyramid.colors.count).reversed(), id: \.self) { index in
                  let color = pyramid.colors[index]
                  Rectangle()
                    .fill(Color("\(color)"))
                    .frame(height: 25)
                    .id(index)
                }
              }
            }
            .frame(width: 50, height: 100)
            .border(Color.white)
            .contentShape(Rectangle())
            .onTapGesture {
              viewModel.touchPyramid(i)
            }
          }
        }
        .padding()
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
