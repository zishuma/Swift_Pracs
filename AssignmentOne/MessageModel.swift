//
//  MessageModel.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/25.
//

import Foundation

class MessageModel : ObservableObject {
    @Published var messages : [Message] = [
        Message(id: "1", pic: "profileSmall", name: "桃子猪", description: "成都的天气真的是反复无常，就像我老妈的脸色一样"),
        Message(id: "2", pic: "viewSmall", name: "草莓🐰", description: "清明节三天假走起！ 想去乐山吃钵钵鸡的组队！！"),
        Message(id: "3", pic: "harbour", name: "芒果", description: "疫情什么时候能结束啊，让孩子回家吧。。。。。"),
        Message(id: "4", pic: "profileSmall", name: "桃子猪", description: "真的是每逢佳节胖三斤，过年的大鱼大肉吃的我胖了两公斤！增肥容易减肥难"),
        Message(id: "5", pic: "viewSmall", name: "草莓🐰", description: "陷入EMO，需要红包安慰"),
        Message(id: "6", pic: "profileSmall", name: "桃子猪", description: "救命，生活费见底了！", imag: "moment", follower: "草莓🐰")
    ]
}
