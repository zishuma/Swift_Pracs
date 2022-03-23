//
//  ProfileView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
            ZStack{
                Color(.systemGray6)
                Text("我页面")
                    .foregroundColor(Color(.systemGray))
                    .fontWeight(.bold)
                    
            }
            .background((Color(.systemGray6)))
        }
        
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
