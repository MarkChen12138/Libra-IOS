//
//  StartContractView.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/10/12.
//

import Foundation
import SwiftUI


struct StartContractView: View {
    @State private var selectedRole: String? = nil
    @State private var productName: String = ""

    var body: some View {
        VStack {
            Text("请选择卖家或买家：")

            Picker("选择角色", selection: $selectedRole) {
                Text("卖家").tag("卖家")
                Text("买家").tag("买家")
            }
            .pickerStyle(SegmentedPickerStyle())

            TextField("产品名称", text: $productName)

            Button("提交") {
                if let role = selectedRole, !productName.isEmpty {
                    // 执行提交操作，role将包含 "卖家" 或 "买家"，productName包含产品名称
                    print("选中的角色: \(role)")
                    print("产品名称: \(productName)")
                } else {
                    // 显示警告或错误消息，要求用户提供所有所需信息
                }
            }
            .disabled(selectedRole == nil || productName.isEmpty)
        }
        .padding()
    }
}


struct StartContractPreview: PreviewProvider {
    static var previews: some View {
        StartContractView()
    }
}
