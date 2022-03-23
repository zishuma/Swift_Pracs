//
//  WechatView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/23.
//

import SwiftUI

struct WechatView: View {
    var body: some View {
            ZStack{
                Color(.systemGray6)
                Text("微信页面")
                    .foregroundColor(Color(.systemGray))
                    .fontWeight(.bold)
                    
            }
            .background((Color(.systemGray6)))
        
    }
}

struct WechatView_Previews: PreviewProvider {
    static var previews: some View {
        WechatView()
    }
}
