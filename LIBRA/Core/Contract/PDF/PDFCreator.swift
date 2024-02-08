//
//  PDFCreater.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/9/24.
//

import Foundation
import UIKit
import PDFKit
import SwiftUI

class PDFCreator: ObservableObject {

    @Published var payDate: Date
    @Published var issueDate: Date
    @Published var arrivalDate: Date
    
    @Published var contractNumber: String
    @Published var seller: String
    @Published var buyer: String
    @Published var product: String
    @Published var quality: String
    @Published var quantity: String
    @Published var origin: String
    @Published var ship: String
    @Published var unitPrice: String
    

    
    init(payDate: Date, issueDate: Date, arrivalDate: Date, contractNumber: String, seller: String, buyer: String, product: String, quality: String, quantity: String, origin: String, ship: String, unitPrice: String) {
        self.payDate = payDate
        self.issueDate = issueDate
        self.arrivalDate = arrivalDate
        self.contractNumber = contractNumber
        self.seller = seller
        self.buyer = buyer
        self.product = product
        self.quality = quality
        self.quantity = quantity
        self.origin = origin

        self.ship = ship
        self.unitPrice = unitPrice
    }
    
    let pageWidth = 8.5 * 72.0
    let pageHeight = 11 * 72.0
    

  func createContract() -> Data {

    // 1
    let pdfMetaData = [
      kCGPDFContextCreator: "Libra",
      kCGPDFContextAuthor: "Mark Chen",
      kCGPDFContextTitle: "合同"
    ]
    
    let format = UIGraphicsPDFRendererFormat()
    format.documentInfo = pdfMetaData as [String: Any]
    
    // 2

    let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
    
    // 3
    let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        
    // 4
    let data = renderer.pdfData { (context) in
    
      // first page created
      context.beginPage()
    
      // 6
        _ = addTitle(pageRect: pageRect)
      let imageBottom = 0.00
        addBodyText(firstPageGenerator(), pageRect: pageRect, textTop: imageBottom + 18.0)
        context.beginPage()
        addBodyText(contractTextb, pageRect: pageRect, textTop: imageBottom + 18.0)
        context.beginPage()
        addBodyText(contractTextc, pageRect: pageRect, textTop: imageBottom + 18.0)
        context.beginPage()
        addBodyText(contractTextd, pageRect: pageRect, textTop: imageBottom + 18.0)
        context.beginPage()
        addBodyText(contractTexte, pageRect: pageRect, textTop: imageBottom + 18.0)
        
      
    }
    
    return data
  }
    
  func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: date)
  }


  func addTitle(pageRect: CGRect) -> CGFloat {
    
    // 1
    let titleFont = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        
    // 2
    let titleAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: titleFont]
    let attributedTitle = NSAttributedString(string: "Contract Sample", attributes: titleAttributes)
        
    // 3
    let titleStringSize = attributedTitle.size()
        
    // 4
    let titleStringRect = CGRect(x: (pageRect.width - titleStringSize.width) / 2.0,
                                 y: 36, width: titleStringSize.width, height: titleStringSize.height)
    
    // 5
    attributedTitle.draw(in: titleStringRect)
    
    // 6
    return titleStringRect.origin.y + titleStringRect.size.height
  }

    // 定义页边距
    let topMargin = 72.0
    let bottomMargin = 72.0
    let sideMargin = 72.0

    func addBodyText(_ text: NSAttributedString, pageRect: CGRect, textTop: CGFloat) {

      // 1. 定义字体
        _ = UIFont.systemFont(ofSize: 14)

      // 2. 计算所需大小
      let textSize = text.boundingRect(with: CGSize(width: pageWidth - sideMargin * 2,
                                       height: .greatestFiniteMagnitude),
                       options: .usesLineFragmentOrigin,
                       context: nil).size

      // 3. 得到绘制区域
      let frame = CGRect(x: sideMargin,
                   y: textTop,
                   width: pageWidth - sideMargin * 2,
                   height: textSize.height)
      
      // 直接绘制整个文本
      text.draw(in: frame)
    }
    
    func firstPageGenerator() -> NSAttributedString{
        let contractText1 =

        """

        
        
        
        
                                                                               CONTRACT NO: ZR909667
                                                                               DATE:\(formatDate(issueDate))
        
        

        1. 卖方:
        \(seller)

        2. 买方:
        \(buyer)

        3. 产品
        \(product)

        4. 品质
        \(quality)
        
        5. 数量
        \(quantity)

        6. 货源地
        \(origin)

        7. 交货
        \(formatDate(arrivalDate))

        8. 船舶
        \(ship)

        9. 单价
        \(unitPrice)
        
        10. 付款
        货款通过 TT 结算，并应于 NOR 18 天内结算货款。结算数量应根据装货港（在空气中）
        的提单数量。
        最终结算单价应以三 (3) 位小数表示，如下所示：
        I. 如果第四位小数为五 (5) 或更大，则第三位小数应四舍五入到下一位数字；和
        二、如果第四位小数小于 (5)，则第三位小数将保持不变。
        
        11. 卸货时间
        一个卸货港口全部卸货时间应为 120 小时并加上 6 小时从卸货港锚地递交 NOR 开始计
        时。

        """
        let contractTexta = NSAttributedString(string: contractText1)
        return contractTexta
    }
    

}

