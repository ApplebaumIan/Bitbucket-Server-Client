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
			ProjectPullRequestNav()
			Section(header: BranchIndicator()) {
			Text("Code")
				Text("Commits")
			}
			Section{
				Text(
					"""
				README MARKDOWN Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
				
				Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
				"""
				)
			}
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

struct ProjectPullRequestNav: View {
	var body: some View {
		NavigationLink(destination: PullRequestList()) {
			HStack {
				Text("Pull Requests")
				Spacer()
				Text("2")//Number of Pull Requests
			}
		}
	}
}

struct BranchIndicator: View {
	var body: some View {
		HStack {
			Image(systemName: "arrow.branch")
			Text("master").font(.headline)
			Spacer()
			Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
				Text("Change")
			}
		}
	}
}
