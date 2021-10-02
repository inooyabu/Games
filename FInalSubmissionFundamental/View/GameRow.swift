//
//  GameRow.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 02/10/21.
//

import URLImage
import SwiftUI

struct GameRow: View {
    var game: Game

    var body: some View {
        HStack {

            URLImage(URL(string: "\(game.backgroundImage)")!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }

            VStack(alignment: .leading, spacing: 0) {
                Text(game.name)
                    .font(.system(size: 20))
                    .bold()
                HStack {
                    Text("🗓")
                    Text(game.released)
                        .font(.system(size: 18))
                }
                HStack {
                    Text("⭐️")
                    Text(String(game.rating))
                        .font(.system(size: 18))
                }
            }.padding(.leading, 8)
        }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
    }
}
