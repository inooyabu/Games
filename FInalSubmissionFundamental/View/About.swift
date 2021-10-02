//
//  About.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 02/10/21.
//

import SwiftUI

struct About: View {

    var body: some View {
        ScrollView {
            VStack {
                Spacer(minLength: 80)
                Image("Tes")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 240, alignment: .center)
                Spacer(minLength: 20)
                Text("Tenti")
                    .font(.system(size: 25))
                    .bold()
                Text("tentiaap@gmail.com")

            }
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
