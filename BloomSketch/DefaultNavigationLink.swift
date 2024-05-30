//
//  DefaultNavigationLink.swift
//  BloomSketch
//
//  Created by MacBook Pro on 17/05/24.
//

import SwiftUI

struct DefaultNavigationLink: View {
    @Binding var action: Int?

    var body: some View {
        Group {
            NavigationLink(
                destination: TreeHomeView()
                    .navigationTitle("Yebol's Den")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(
                        trailing: HStack(spacing: 1) {
                            Menu {
                            } label: {
                                Image("menu")
                                    .resizable()
                                    .frame(width: 22, height: 22)
                            }
                        }
                    ),
                tag: 1,
                selection: $action
            ) {
                EmptyView()
            }
            .hidden()

            NavigationLink(
                destination: TreeHomeView()
                    .navigationTitle("Drawing List")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarBackButtonHidden(true),
                tag: 2,
                selection: $action
            ) {
                EmptyView()
            }
            .hidden()
        }
    }
}

