//
//  FavoriteGameRow.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 03/10/21.
//

import URLImage
import SwiftUI

struct FavoriteGameRow: View {
    var favGame: FavoriteViewModel

    var body: some View {
        HStack {

            URLImage(URL(string: "\(favGame.backroundImage)")!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }

            VStack(alignment: .leading, spacing: 0) {
                Text(favGame.name)
                    .font(.system(size: 20))
                    .bold()
                HStack {
                    Text("🗓")
                    Text(favGame.released)
                        .font(.system(size: 18))
                }
                HStack {
                    Text("⭐️")
                    Text(String(favGame.rating))
                        .font(.system(size: 18))
                }
            }.padding(.leading, 8)
        }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
    }
}

