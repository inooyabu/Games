//
//  Search.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 03/10/21.
//

import SwiftUI

struct ListDeveloper: View {
    @ObservedObject var apiDeveloper = ApiDeveloper()

    var body: some View {
        VStack {
            if apiDeveloper.loading {
                ProgressView()
            } else {
                List(apiDeveloper.developers.results) { dev in
                    NavigationLink(destination: DetailDeveloper(developer: dev)) {
                        DeveloperRow(developer: dev)
                    }

                }
            }
        }
    }
}
