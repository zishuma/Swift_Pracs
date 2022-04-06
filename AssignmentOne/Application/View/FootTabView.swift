//
//  FootTabView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/23.
//

import SwiftUI

struct FootTabView: View {
    var body: some View {
        TabView{
            WechatView()
                .tabItem(){
                    Image(systemName: "message.fill")
                    Text("微信")
                }
            AddressBookView()
                .tabItem(){
                    Image(systemName: "phone.fill")
                    Text("通讯录")
                }
            DiscoverView()
                .tabItem(){
                    Image(systemName: "safari.fill")
                    Text("发现")
                }
            ProfileView()
                .tabItem(){
                    Image(systemName: "person.fill")
                    Text("我")
                }
        }
        .background(Color(.systemGray6))
    }
}

struct FootTabView_Previews: PreviewProvider {
    static var previews: some View {
        FootTabView()
    }
}
