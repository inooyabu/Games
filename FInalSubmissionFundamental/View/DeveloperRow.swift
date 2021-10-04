//
//  DeveloperRow.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 04/10/21.
//

import SwiftUI
import URLImage

struct DeveloperRow: View {
    var developer: Developers

    var body: some View {
        HStack {

            URLImage(URL(string: "\(developer.imageBackground)")!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }

            VStack(alignment: .leading, spacing: 0) {
                Text(developer.name)
                    .font(.system(size: 20))
                    .bold()
            }.padding(.leading, 8)
        }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
    }
}
