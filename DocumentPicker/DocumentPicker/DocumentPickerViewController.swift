//
//  DocumentPickerViewController.swift
//  DocumentPicker
//
//  Created by Shameem A. Khan on 04/12/2022.
//

import Foundation
import UIKit
import UniformTypeIdentifiers

typealias Completion = (String)->Void

final class DocumentPickerViewController: UIDocumentPickerViewController {
    private let completion: Completion
    private lazy var pickerViewController: UIDocumentPickerViewController = {
        let pickerViewController = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.data], asCopy: true)
        return pickerViewController
    }()
    
    init(_ completion: @escaping Completion) {
        self.completion = completion
        super.init(forOpeningContentTypes: [UTType.data], asCopy: true)
        allowsMultipleSelection = false
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DocumentPickerViewController: UIDocumentPickerDelegate {

    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let url = urls.first else {
            completion("")
            return
        }
        completion(url.relativePath)
    }

}
