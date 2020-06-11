//
//  Repository.swift
//  Bitbucket Server Client
//
//  Created by Ian Applebaum on 6/11/20.
//  Copyright © 2020 Ian Applebaum. All rights reserved.
//

import SwiftUI

struct Repository: View {
    var body: some View {
         List {
			ProjectDetails()
		}
		.padding(.top, -30.0)
		.listStyle(GroupedListStyle())
//				   .navigationBarTitle("Repositories")
    }
}

struct Repository_Previews: PreviewProvider {
    static var previews: some View {
        Repository()
    }
}

struct PrivateIcon: View {
	var body: some View {
		HStack {
			Image(systemName: "lock.circle.fill")
				.padding(.trailing, -5.0)
			Text("Private")
				.frame(width: 60.0)
		}
	}
}

struct NumberOfForks: View {
	var body: some View {
		HStack{
			Image(systemName: "arrow.branch")
			Text("3 Forks")
		}
	}
}

struct ProjectDetails: View {
	var body: some View {
		VStack(alignment: .leading) {
			HStack {
				Image("avatar").resizable()
					.aspectRatio(contentMode: .fit)
					.background(Color.orange.frame(width: 30, height: 30).clipShape(Circle()))
					.foregroundColor(.white)
					.frame(width: 30, height: 30).clipShape(Circle())
				Text("Username")
			}
			Text("Title").font(.largeTitle)
			Text("Description")
				.padding(.top)
			HStack {
				PrivateIcon()
				NumberOfForks()
			}
			
		}
	}
}
