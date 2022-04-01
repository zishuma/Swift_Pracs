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
        if pics.count < 2 {
            AsyncImage(url: URL(string: "\(pics[0].url)")){ image in
                image.resizable()
            }placeholder: {
                ProgressView()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 200)
            }
            .scaledToFit()
            .frame(maxWidth: .infinity, maxHeight: 200)
        }
        else if pics.count < 4 {
            HStack{
                ForEach(pics, id: \.self){pic in
                    ClipImageView(image: pic.url)
                }
            }
                
        }else if pics.count < 5 {
            VStack{
                HStack{
                    ForEach(pics[0..<2], id: \.self){pic in
                        ClipImageView(image: pic.url)
                    }
                }
                HStack{
                    ForEach(pics[2...], id: \.self){pic in
                        ClipImageView(image: pic.url)
                    }
                }
            }
        }else{
            VStack{
                HStack{
                    ForEach(pics[0..<3], id: \.self){pic in
                        ClipImageView(image: pic.url)
                    }
                }
                HStack{
                    ForEach(pics[3..<6], id: \.self){pic in
                        ClipImageView(image: pic.url)
                    }
                }
                HStack{
                    ForEach(pics[6...], id: \.self){pic in
                        ClipImageView(image: pic.url)
                    }
                }
            }
        }
    }
}

struct PostImagesView_Previews: PreviewProvider {
    static var previews: some View {
        PostImagesView(pics: [ImageURL(url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/001.jpeg"), ImageURL(url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/002.jpeg"), ImageURL(url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/003.jpeg")])
    }
}
