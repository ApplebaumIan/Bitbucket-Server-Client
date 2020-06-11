//
//  SearchUI.swift
//  Bitbucket Server Client
//
//  Created by Ian Applebaum on 6/11/20.
//  Copyright © 2020 Ian Applebaum. All rights reserved.
//

import SwiftUI

struct SearchUI: View {
	let array: [String]
	let filters: [String]?
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
	@State private var filterBy = 0
    var body: some View {

//        NavigationView {
            VStack {
                // Search view
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")

                        TextField("search", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }, onCommit: {
                            print("onCommit")
                        }).foregroundColor(.primary)

                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)

                    if showCancelButton  {
                        Button("Cancel") {
                                UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                                self.searchText = ""
                                self.showCancelButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(.horizontal)
                .navigationBarHidden(showCancelButton) // .animation(.default) // animation does not work properly

				VStack {
					if filters != nil {
						Picker(selection: $filterBy, label: Text("What is your favorite color?")) {
							ForEach(0..<filters!.count) { item in
								Text("\(self.filters![item])").tag(item)
							}
						}.padding(.horizontal).pickerStyle(SegmentedPickerStyle())
							.padding(.vertical, 7.0)
					} else {
						/*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
					}
					List {
						// Filtered list of names
						ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
							searchText in PullRequestRow(title: searchText)//Text(searchText)
						}
					}
				.listStyle(GroupedListStyle())
					.resignKeyboardOnDragGesture()
				}
            }
        }
//    }
}



struct SearchUI_Previews: PreviewProvider {
    static var previews: some View {
        Group {
			SearchUI(array: ["Peter", "Paul", "Mary", "Anna-Lena", "George", "John", "Greg", "Thomas", "Robert", "Bernie", "Mike", "Benno", "Hugo", "Miles", "Michael", "Mikel", "Tim", "Tom", "Lottie", "Lorrie", "Barbara"], filters: ["Created","Mentioned","Requested"])
              .environment(\.colorScheme, .light)

			SearchUI(array: ["Peter", "Paul", "Mary", "Anna-Lena", "George", "John", "Greg", "Thomas", "Robert", "Bernie", "Mike", "Benno", "Hugo", "Miles", "Michael", "Mikel", "Tim", "Tom", "Lottie", "Lorrie", "Barbara"], filters: nil)
              .environment(\.colorScheme, .dark)
        }
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
