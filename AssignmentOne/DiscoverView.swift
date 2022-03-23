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
            .padding(.leading, 3)
            .foregroundColor(Color(.systemBlue))
            
        Text("\(text)")
            .padding(.leading, 3)
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
                    NavigationLink(destination: EmptyView()){
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
