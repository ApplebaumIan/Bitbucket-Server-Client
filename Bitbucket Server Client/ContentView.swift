//
//  ContentView.swift
//  Bitbucket Server Client
//
//  Created by Ian Applebaum on 6/10/20.
//  Copyright © 2020 Ian Applebaum. All rights reserved.
//

import SwiftUI
var profile: Image? = Image("avatar")

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
			Home()
			Notifications()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			ContentView()
			ContentView().environment(\.colorScheme, .dark)
		}
    }
}
struct PullRequestRow: View {
    var body: some View {
         NavigationLink(destination: Text("Second View")) {
			HStack {
				Image(systemName: "arrow.merge").background(Color.blue.frame(width: 30, height: 30).clipShape(RoundedRectangle(cornerRadius: 5)))
					.foregroundColor(.white)
				Spacer()
					.frame(width: 20.0)
				Text("Pull Requests")
			}
			.padding(.leading, 3.0)
		   }
    }
}
struct RepoRow: View {
    var body: some View {
         NavigationLink(destination: Text("Second View")) {
			HStack {
				Image(systemName: "cube.box").background(Color.purple.frame(width: 30, height: 30).clipShape(RoundedRectangle(cornerRadius: 5)))
					.foregroundColor(.white)
				Spacer()
					.frame(width: 16.0)
				Text("Repositories")
					
				
			}
			.padding(.leading,-1)
		   }
    }
}
struct ProjectsRow: View {
    var body: some View {
         NavigationLink(destination: Text("Second View")) {
			HStack {
				Image(systemName: "folder").background(Color.orange.frame(width: 30, height: 30).clipShape(RoundedRectangle(cornerRadius: 5)))
					.foregroundColor(.white)
				Spacer()
					.frame(width: 14.0)
				Text("Projects")

			}
			.padding(.leading,-1)
		   }
    }
}
struct RepoFavRow: View {
	var repoImage: Image?
	var name: Text
    var body: some View {
         NavigationLink(destination: Text("Second View")) {
			HStack {
				repoImage?.resizable()
					.aspectRatio(contentMode: .fit)
					.background(Color.orange.frame(width: 30, height: 30).clipShape(RoundedRectangle(cornerRadius: 5)))
					.foregroundColor(.white)
					.frame(width: 30, height: 30).clipShape(RoundedRectangle(cornerRadius: 5))
				
				Spacer()
					.frame(width: 14.0)
				name

			}
			.padding(.leading,-1)
			
		   }
    }
}
struct Home: View {
	var body: some View {
		NavigationView {
			List {
				Section(header: Text("My Work").font(.headline)) {
					PullRequestRow()
					RepoRow()
					ProjectsRow()
					
				}
				Section(header: Text("Favorites").font(.headline)) {
					ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
						RepoFavRow(repoImage:Image("avatar"), name: Text("ApplebaumIan/epotek-product-visualizer"))
					}
				}
			}.listStyle(GroupedListStyle())
				.navigationBarTitle("Home")
			.navigationBarItems(leading:
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
					if profile == nil {
						Image(systemName: "person.crop.circle")
							.imageScale(.large)
					} else {
						Image("avatar")
						.resizable()
							.renderingMode(.original)
						.imageScale(.small)
							.frame(width: 30.0, height: 30.0)
						.clipShape(Circle())
						
					}
//							.padding()
					
				}
			)
		}
			.tabItem {
				VStack {
					Image(systemName: "house.fill")
					Text("Home")
				}
		}
		.tag(0)
	}
}

struct Notifications: View {
	var body: some View {
		Text("Notifications")
			.font(.title)
			.tabItem {
				VStack {
					Image(systemName: "bell.fill")
					Text("Notifications")
				}
		}
		.tag(1)
	}
}
