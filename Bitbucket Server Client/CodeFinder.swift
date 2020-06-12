//
//  CodeFinder.swift
//  Bitbucket Server Client
//
//  Created by Ian Applebaum on 6/11/20.
//  Copyright © 2020 Ian Applebaum. All rights reserved.
//

import SwiftUI

struct CodeFinder: View {
    var body: some View {
		List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
			if item % 2 == 0{
				
				FileRow()
			}else{
				
				FolderRow()
			}
		}.navigationBarTitle("Code", displayMode: .inline)
		.navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
		Image(systemName: "ellipsis")
		})
    }
}

struct CodeFinder_Previews: PreviewProvider {
    static var previews: some View {
        CodeFinder()
    }
}

/*
  ___________________
:' ,__________,  ':  `.
| '            `  |    `.
| |  Hello     |  |      `.
| |            |  |        \
| |  (Again!)  |  |         ]
| |            |  |~~~~~~.  )
| `,__________,'  |\__O\_| ,'
|    _______      |     \.`
|<> [___=___](@)<>|    .'\
':________________/__.'   )
   (____________)        /
                        /
              _________/
  ___________/______
 /''''=========='(@)\___
 |[][][][][][][][][]|   \ _______
 |[][][][][][][][][]|    \__     \
 |[][][][][][][][][]|    |  \..  |
 \------------------/    | ( # ) |
         dan greuel      |  '''  |
                1999     \_______/
*/

struct FileRow: View {
	var body: some View {
		HStack {
			Image(systemName: "doc").foregroundColor(.gray)
			Text("HelloWorld.swift")
		}
	}
}

struct FolderRow: View {
	var body: some View {
		HStack {
			Image(systemName: "folder").foregroundColor(.yellow)
			Text("foo")
		}
	}
}
