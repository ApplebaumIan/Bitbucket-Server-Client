//
//  PullRequestList.swift
//  Bitbucket Server Client
//
//  Created by Ian Applebaum on 6/10/20.
//  Copyright © 2020 Ian Applebaum. All rights reserved.
//

import SwiftUI

struct PullRequestRow: View {
	@State var buildStatus: BuildStatus? = .processing
	var title: String?
	var body: some View{
		HStack {
			VStack {
				ProjectInfo()
				ActivityTitle(title: title)
				MessagePreview()
					.padding(.bottom)
				
			}
			BuildStatusIcon(status: $buildStatus)
			ActivityInfoNumbers()
		}
	}
}
struct PullRequestList: View {
    @State private var filterBy = 0
	var body: some View {
		SearchUI(array: ["Peter", "Paul", "Mary", "Anna-Lena", "George", "John", "Greg", "Thomas", "Robert", "Bernie", "Mike", "Benno", "Hugo", "Miles", "Michael", "Mikel", "Tim", "Tom", "Lottie", "Lorrie", "Barbara"], filters: ["Created","Mentioned","Requested"]).navigationBarTitle("Pull Requests")
		}
    
}

struct PullRequestList_Previews: PreviewProvider {
    static var previews: some View {
        PullRequestList()
    }
}
enum BuildStatus{
	case success,processing,failing
}

struct BuildStatusIcon: View {
	@Binding var status: BuildStatus?
	
	@ViewBuilder var body: some View{
//		switch status {
//		case .success:
//			return EmptyView()
//		case .processing:
//			return EmptyView()
//		case .failing:
//			return Image(systemName: "exclamationmark.circle").padding(.trailing).imageScale(.large)
//
//		default:
//			return EmptyView()
//		}
		if status == .success {
			Image(systemName: "checkmark.circle")
				.padding(.trailing)
				.imageScale(.large)
				.foregroundColor(.green)

		}
		else if status == .processing{
			Image(systemName: "clock")
						.padding(.trailing)
						.imageScale(.large)
						.foregroundColor(.yellow)
		}
		else{
			Image(systemName: "exclamationmark.circle")
				.padding(.trailing)
				.imageScale(.large)
				.foregroundColor(.red)
		}
		
	}
}
