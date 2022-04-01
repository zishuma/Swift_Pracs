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
            ProgressView()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 200)
        }
    }
}

struct ClipImageView_Previews: PreviewProvider {
    static var previews: some View {
        ClipImageView(image: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/001.jpeg")
    }
}
