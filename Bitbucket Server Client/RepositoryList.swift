//
//  RepositoryList.swift
//  Bitbucket Server Client
//
//  Created by Ian Applebaum on 6/11/20.
//  Copyright © 2020 Ian Applebaum. All rights reserved.
//

import SwiftUI

struct RepositoryList: View {
    var body: some View {
        List {
			
			RepoFavRow(repoImage: Image("avatar"), name:Text( "Applebaumian/big-buck-bunny"))
			RepoFavRow(repoImage: Image("avatar"), name:Text( "Applebaumian/epotek-product-Visualizer"))
			RepoFavRow(repoImage: Image("avatar"), name:Text( "Applebaumian/bit-bucket-client"))
			RepoFavRow(repoImage: nil, name:Text( "likhongomes/leo-POS-app"))
			
		}
		.listStyle(GroupedListStyle())
			.navigationBarTitle("Repositories")
    }
}

struct RepositoryList_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryList()
    }
}
