//
//  DiscoverView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/23.
//

import SwiftUI

struct SingleNav : View {
    var text : String
    var pic : String
    var body: some View {
        Image(systemName: "\(pic)")
            .font(.system(size: 15.0))
            .frame(width: 1)
            .foregroundColor(Color(.systemBlue))
            .offset(x: 10)
        Text("\(text)")
            .offset(x: 25)
    }
}

struct DiscoverView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("发现")
                    .fontWeight(.bold)
                    .navigationBarTitleDisplayMode(.inline)
                
                List{
                    NavigationLink(destination: MessageView()){
                        SingleNav(text: "朋友圈", pic: "circle.circle.fill")
                    }
                    NavigationLink(destination: EmptyView()){
                        SingleNav(text: "游戏", pic: "gamecontroller.fill")
                    }
                    NavigationLink(destination: EmptyView()){
                        SingleNav(text: "小程序", pic: "circle.dashed")
                    }
                    
                }
                
            }
            .background((Color(.systemGray6)))
            .padding(.top, -25)
            Spacer()
        }
        .ignoresSafeArea(edges: .top)
}
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
