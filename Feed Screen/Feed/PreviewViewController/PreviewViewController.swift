//
//  PreviewViewController.swift
//  Feed Screen
//
//  Created by Kibbcom on 26/03/24.
//

import UIKit
import WebKit
import PDFKit

class PreviewViewController: UIViewController {
    
    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var videoPreview: WKWebView!
    @IBOutlet weak var documentPreview: UIView!
    
    var image: Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previewView.layer.borderWidth = 0.2
        setData()
    }
    
    func setData() {
        if let image = image as? String {
            previewImage.isHidden = false
            videoPreview.isHidden = true
            documentPreview.isHidden = true
            previewImage.image = UIImage(named: image)
        } else if let videoUrl = image as? URL {
            videoPreview.isHidden = false
            previewImage.isHidden = true
            documentPreview.isHidden = true
            let request = URLRequest(url: videoUrl)
            videoPreview.load(request)
        } else if let fileUrl = image as? URL {
            documentPreview.isHidden = false
            videoPreview.isHidden = true
            previewImage.isHidden = true
            
            if let pdfDocument = PDFDocument(url: fileUrl) {
                let pdfView = PDFView(frame: documentPreview.bounds)
                pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                pdfView.displayMode = .singlePageContinuous 
                pdfView.autoScales = true
                pdfView.displayDirection = .vertical
                pdfView.document = pdfDocument
                documentPreview.addSubview(pdfView)
            }
        }
    }

        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }

