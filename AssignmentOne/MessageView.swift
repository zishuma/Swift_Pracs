//
//  messageView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/23.
//

import SwiftUI

struct TextOverlayView : View {
    var body: some View{
        ZStack{
            Text("朋友圈")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .padding(.top, 15)
        }.background(.white)
            .opacity(0.8)
            .padding(6)
            .offset(y: -20)
    }
}

struct MessageView: View {
    var body: some View {
        VStack{
            ZStack{
                Image("view")
                    .ignoresSafeArea(edges: .top)
                    .overlay(TextOverlayView(), alignment: .top)
            }
            HStack{
                Spacer()
                Text("桃子猪")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Image("profile")
            }
            .offset(y: -100)
            .padding()
            Spacer()
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
