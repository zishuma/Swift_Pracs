//
//  PostImagesView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/31.
//

import SwiftUI

struct PostImagesView: View {
    var pics: [ImageURL]
    
    var body: some View {
        if pics.count < 4 {
            HStack{
                ForEach(pics, id: \.self){pic in
                    AsyncImage(url: URL(string: pic.url)){ image in
                        image.resizable()
                    }placeholder: {
                        ProgressView()
                    }
                    .frame(width: 80, height: 80)
                }
            }
        }else {
            Text("too many images!!!")
        }
    }
}

struct PostImagesView_Previews: PreviewProvider {
    static var previews: some View {
        PostImagesView(pics: [ImageURL(url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/001.jpeg"), ImageURL(url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/002.jpeg"), ImageURL(url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/003.jpeg")])
    }
}
