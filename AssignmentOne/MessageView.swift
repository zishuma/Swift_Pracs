//
//  messageView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/23.
//

import SwiftUI

struct Message : Identifiable {
    var id : String
    var pic : String
    var name : String
    var description : String
    var imag : String?
    var follower : String?
    
}

struct UserImage : View {
    var body: some View {
        HStack{
            Spacer()
            Text("桃子猪")
                .fontWeight(.bold)
                .foregroundColor(.white)
            Image("profile")
        }
        .offset(x: -40)
        .offset(y: 20)
    }
}

struct MessageView: View {
    @State var msgs = [
        Message(id: "1", pic: "profileSmall", name: "桃子猪", description: "成都的天气真的是反复无常，就像我老妈的脸色一样"),
        Message(id: "2", pic: "viewSmall", name: "草莓🐰", description: "清明节三天假走起！ 想去乐山吃钵钵鸡的组队！！"),
        Message(id: "3", pic: "harbour", name: "芒果", description: "疫情什么时候能结束啊，让孩子回家吧。。。。。"),
        Message(id: "4", pic: "profileSmall", name: "桃子猪", description: "真的是每逢佳节胖三斤，过年的大鱼大肉吃的我胖了两公斤！增肥容易减肥难"),
        Message(id: "5", pic: "viewSmall", name: "草莓🐰", description: "陷入EMO，需要红包安慰"),
        Message(id: "6", pic: "profileSmall", name: "桃子猪", description: "救命，生活费见底了！", imag: "moment", follower: "草莓🐰")
    ]
    
    var body: some View {
        ScrollView(.vertical){
            ZStack{
                Image("view")
                    .overlay(UserImage(), alignment: .bottomTrailing)
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            LazyVStack(alignment: .leading) {
                ForEach(msgs){ msg in
                    HStack(alignment: .top){
                        Image("\(msg.pic)")
                        VStack(alignment: .leading){
                            Text("\(msg.name)")
                                .fontWeight(.bold)
                                .padding(.bottom, 1)
                            Text("\(msg.description)")
                                .foregroundColor(.secondary)
                            
                            if let im = msg.imag {
                                Image("\(im)")
                            }
                            if let fo = msg.follower {
                                ZStack{
                                    Color.gray
                                    HStack{
                                        Image(systemName: "suit.heart")
                                            .foregroundColor(.white)
                                        Text("\(fo)")
                                            .foregroundColor(.white)
                                        Spacer()
                                    }
                                }
                                
                            }
                        }
                    }
                }
            }
            .background(Color.white)
            .padding()
        }
        .navigationTitle("朋友圈")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
