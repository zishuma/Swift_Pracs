//
//  SinglePostView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/25.
//

import SwiftUI

struct SinglePostView: View {
    var msg : Message
    
    var body: some View {
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

struct SinglePostView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePostView(msg: Message(id: "1", pic: "profileSmall", name: "桃子猪", description: "成都的天气真的是反复无常，就像我老妈的脸色一样")
)
    }
}
