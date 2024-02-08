import UIKit
import PDFKit

class PDFPreviewViewController: UIViewController {
  // 用于存储PDF文件数据的属性
  public var documentData: Data?
  @IBOutlet weak var pdfView: PDFView!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 检查是否有有效的PDF文件数据
    if let data = documentData {
      // 创建PDF文档并将其分配给PDF视图
      pdfView.document = PDFDocument(data: data)
      
      // 自动调整PDF视图以适应屏幕
      pdfView.autoScales = true
    }
  }
}
