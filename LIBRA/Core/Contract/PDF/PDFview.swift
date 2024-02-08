//
//  ContractView.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/9/24.
//

import Foundation
import SwiftUI
import UIKit

// ContractView

struct ContractView: View {
    
    @State private var payDate: Date = Date()
    
    @State private var issueDate: Date = Date()
    
    @State private var arrivalDate: Date = Date()
    
    @State private var contractNumber = ""

    @State private var seller = ""

    @State private var buyer = ""

    @State private var product = ""

    @State private var quality = ""

    @State private var quantity = ""

    @State private var origin = ""

    @State private var ship = ""

    @State private var unitPrice = ""
    
    @State private var showAlert = false

  var neededInfoProvided: Bool {
      if  seller.isEmpty || buyer.isEmpty || product.isEmpty || quality.isEmpty || quantity.isEmpty || origin.isEmpty || ship.isEmpty || unitPrice.isEmpty {
      return false
    }
    return true
  }

  var generateAction: () -> Data {
      let pdfCreator = PDFCreator(payDate: payDate, issueDate: issueDate, arrivalDate: arrivalDate, contractNumber: contractNumber, seller: seller, buyer: buyer, product: product, quality: quality, quantity: quantity, origin: origin,  ship: ship, unitPrice: unitPrice)
    return pdfCreator.createContract
  }
    
    

  var body: some View {

    Form {
      Section {
        TextField("Seller", text: $seller)
        TextField("Buyer", text: $buyer)
        DatePicker("Issue Date", selection: $issueDate, displayedComponents: [.date])
                  .datePickerStyle(.automatic)
        DatePicker("Pay Date", selection: $payDate, displayedComponents: [.date])
                  .datePickerStyle(.automatic)
      }

      Section {
        TextField("Product", text: $product)
        TextField("Quality", text: $quality)
        TextField("Quantity", text: $quantity)
        TextField("Origin", text: $origin)
        TextField("Ship", text: $ship)
        TextField("Unit Price", text: $unitPrice)
      }
        
        
        

      Button("Generate") {
        if neededInfoProvided {
          let pdfData = generateAction()
          print("build success!")

          // 将 PDF 文件保存到电脑上
          let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
          let pdfURL = documentDirectory.appendingPathComponent("flyer.pdf")
            _ = pdfURL.path

          // 使用您指定的电脑地址
          let targetDirectory = URL(fileURLWithPath: "/Users/ctrl/Desktop/libra")
          let targetPath = targetDirectory.appendingPathComponent("flyer.pdf")

          do {
            try pdfData.write(to: targetPath)
          } catch {
            print(error)
          }

          // 弹出对话框，询问用户是否要保存 PDF 文件
          showAlert = true
        } else {
          showAlert = true
        }
      }.alert(isPresented: $showAlert) {
        Alert(title: Text("Save PDF?"), message: Text("Do you want to save the generated PDF file?"), primaryButton: .default(Text("Save")) {
          // 保存 PDF 文件到用户的设备
        }, secondaryButton: .cancel())
      }

    }

  }

}
