//
//  DetailDeveloper.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 04/10/21.
//

import SwiftUI
import URLImage

struct DetailDeveloper: View {
    var developer: Developers

    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                URLImage(URL(string: "\(developer.imageBackground)")!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .border(Color.gray.opacity(0.5))
                        .offset(x: 0, y: 0)
                        .padding(.bottom, 0)
                        .frame(width: UIScreen.main.bounds.height/8*3, height: UIScreen.main.bounds.height/2)
                }
                Text(developer.name)
                    .font(.system(size: 25))
                    .bold()

                Spacer(minLength: 20)

                Text("List Games")
                    .bold()

                ForEach(developer.games) { game in
                    VStack {
                        Text(game.name)
                    }
                }
            }

        .navigationBarTitle(Text(developer.name), displayMode: .inline)
            .padding()
    }
}
}
