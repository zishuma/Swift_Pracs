//
//  ImagePlaceholderView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/4/1.
//

import SwiftUI

struct ImagePlaceholderView: View {
    var body: some View {
        ZStack{
            Image("placeholder")
                .resizable()
            ProgressView()
        }
    }
}

struct ImagePlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePlaceholderView()
    }
}
