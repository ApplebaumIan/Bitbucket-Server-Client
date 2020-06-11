//
//  Notifications.swift
//  Bitbucket Server Client
//
//  Created by Ian Applebaum on 6/10/20.
//  Copyright © 2020 Ian Applebaum. All rights reserved.
//

import SwiftUI
struct ActivityRow: View {
    var body: some View {
         NavigationLink(destination: Text("Second View")) {
			HStack {
				VStack(alignment: .leading) {
					ProjectInfo() // Project Title
					ActivityTitle()
					MessagePreview()
						.padding(.bottom)
				}
				ActivityInfoNumbers()
				
					
					
			}
		   }
    }
}
struct Notifications: View {
	var body: some View {
		NavigationView {
			List {
				
				ActivityRow()
				
			}
			.listStyle(GroupedListStyle())
				.navigationBarTitle("Activity")
			.navigationBarItems(trailing:
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
				Image(systemName: "line.horizontal.3.decrease.circle")
				}
			)
		}
			.tabItem {
				VStack {
					Image(systemName: "bell.fill")
					Text("Notifications")
				}
		}
		.tag(1)
	}
}

struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        Notifications()
    }
}

struct ActivityTitle: View {
	var body: some View {
		HStack {
			ActivityTypeIcon()
//			Spacer()
//				.frame(width: 14.0)
			Text("PULL REQUEST TITLE")
				.lineLimit(1)
			Spacer()
		}
		.padding(.leading,-1)
	}
}

struct MessagePreview: View {
	var body: some View {
		HStack {
			Image("avatar").resizable()
				.aspectRatio(contentMode: .fit)
				.background(Color.orange.frame(width: 30, height: 30).clipShape(Circle()))
				.foregroundColor(.white)
				.frame(width: 30, height: 30).clipShape(Circle())
			
			Spacer()
				.frame(width: 14.0)
			Text("Message preview Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Condimentum lacinia quis vel eros donec. Vel quam elementum pulvinar etiam. Amet consectetur adipiscing elit ut aliquam purus sit amet luctus. Egestas integer eget aliquet nibh praesent. Nunc lobortis mattis aliquam faucibus purus in massa. Ipsum faucibus vitae aliquet nec ullamcorper sit amet risus. Id diam vel quam elementum pulvinar. Faucibus et molestie ac feugiat sed lectus vestibulum mattis. Ut tortor pretium viverra suspendisse potenti nullam ac tortor. Morbi non arcu risus quis varius quam quisque id.")
				.lineLimit(2)
				.padding(.top)
		}
	}
}

struct ProjectInfo: View {
	var body: some View {
		HStack {
			Text("ApplebaumIan/epotek-product-visualizer").font(.caption).foregroundColor(Color.gray).lineLimit(1)
			Text("#2").font(.caption)
			
		}
	}
}

struct ActivityTypeIcon: View {
	var body: some View {
		ZStack{
			RoundedRectangle(cornerRadius: 5).frame(width: 30, height: 30)
				.foregroundColor(.blue)
			Image(systemName: "arrow.merge")
				.foregroundColor(.white)
		}
//			.background(Color.blue.frame(width: 30, height: 30).clipShape(RoundedRectangle(cornerRadius: 5)))
//			.foregroundColor(.white)
	}
}

struct ActivityInfoNumbers: View {
	var body: some View {
		VStack {
			Text("2d")
				.font(.footnote)
				.fontWeight(.thin)
			Spacer()
			ZStack{
				RoundedRectangle(cornerRadius: 5)
					.frame(width: 31.0, height: 31.0)
					.foregroundColor(.black)
				RoundedRectangle(cornerRadius: 5)
					.frame(width: 30.0, height: 30.0)
					.foregroundColor(.pink)
				
				Text("2").font(.footnote)
					.fontWeight(.black)
					.foregroundColor(.white)
			}
			Spacer()
			Text("")//Cheap trick for spacing...
		}
	}
}
