//
//  CommitsView.swift
//  Bitbucket Server Client
//
//  Created by Ian Applebaum on 6/11/20.
//  Copyright © 2020 Ian Applebaum. All rights reserved.
//

import SwiftUI

struct CommitsView: View {
	@State var buildStatus: BuildStatus? = .success
    var body: some View {
		List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
			HStack {
				VStack(alignment: .leading) {
					HStack(alignment: .top) {
						Text("commit name").bold()
						Spacer()
						Text("2d")
							.font(.footnote)
					}
					HStack {
							Image("avatar").resizable()
								.aspectRatio(contentMode: .fit)
								.background(Color.orange.frame(width: 30, height: 30).clipShape(Circle()))
								.foregroundColor(.white)
								.frame(width: 30, height: 30).clipShape(Circle())
							

						
						Text("Applebaumian")
							.font(.footnote)
						Image(systemName: "checkmark.shield.fill").imageScale(.small)
							.foregroundColor(.blue)
						Spacer()
						BuildStatusIcon(status: self.$buildStatus)
							.padding(.trailing, -15.0)
					}
					.padding(.bottom, 5.0)
				}
			}
		}.listStyle(DefaultListStyle())
			.navigationBarTitle("Commits", displayMode: .inline)
    }
}

struct CommitsView_Previews: PreviewProvider {
    static var previews: some View {
        CommitsView()
    }
}
