//
//  UserBanner.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/1.
//

import SwiftUI

struct UserImage : View {
    var name: String
    var avatar: String
    
    var body: some View {
        HStack{
            Spacer()
            Text(name)
                .fontWeight(.bold)
                .foregroundColor(.white)
            AsyncImage(url: URL(string: avatar)){ image in
                image.resizable()
            }placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
        }
        .offset(x: -0)
        .offset(y: 0)
    }
}


struct UserBanner_Previews: PreviewProvider {
    static var previews: some View {
        UserImage(name: "taozizhu", avatar:
        "https://thoughtworks-mobile-2018.herokuapp.com/images/user/profile-image.jpg")
    }
}
