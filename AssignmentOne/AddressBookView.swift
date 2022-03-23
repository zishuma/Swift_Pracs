//
//  AddressBookView.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/23.
//

import SwiftUI

struct AddressBookView: View {
    var body: some View {
            ZStack{
                Color(.systemGray6)
                Text("通讯录页面")
                    .foregroundColor(Color(.systemGray))
                    .fontWeight(.bold)
        }
            .background((Color(.systemGray6)))
    }
}

struct AddressBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddressBookView()
    }
}
