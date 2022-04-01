//
//  ClipImageView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/1.
//

import SwiftUI

struct ClipImageView: View {
    var image: String
    
    var body: some View {
        AsyncImage(url: URL(string: image)){ image in
            image.resizable()
                .aspectRatio(1.0, contentMode: .fit)
        }placeholder: {
            ImagePlaceholderView()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 100)
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .clipped()
    }
}

struct ClipImageView_Previews: PreviewProvider {
    static var previews: some View {
        ClipImageView(image: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/001.jpeg")
    }
}
