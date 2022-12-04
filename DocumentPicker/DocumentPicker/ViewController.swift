//
//  ViewController.swift
//  DocumentPicker
//
//  Created by Shameem A. Khan on 04/12/2022.
//

import UIKit
import UniformTypeIdentifiers

class ViewController: UIViewController {

    private lazy var detailsLable: UILabel = {
        let detailsLable = UILabel()
        detailsLable.translatesAutoresizingMaskIntoConstraints = false
        detailsLable.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        detailsLable.textColor = .secondaryLabel
        detailsLable.numberOfLines = 0
        detailsLable.lineBreakMode = .byWordWrapping
        detailsLable.text = "No file seleted"
        detailsLable.textAlignment = .center
        return detailsLable
    }()
    
    private lazy var fileBrowserBtn: UIButton = {
        let openFileBrowserBtn = UIButton(type: .roundedRect)
        openFileBrowserBtn.translatesAutoresizingMaskIntoConstraints = false
        openFileBrowserBtn.setTitle("Open file browser", for: .normal)
        openFileBrowserBtn.addTarget(self, action: #selector(ViewController.openFileBrowser), for: .touchUpInside)
        return openFileBrowserBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }


    private func setupUI() {
        view.addSubview(fileBrowserBtn)
        NSLayoutConstraint.activate([
            fileBrowserBtn.heightAnchor.constraint(equalToConstant: 30),
            fileBrowserBtn.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            fileBrowserBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fileBrowserBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        view.addSubview(detailsLable)
        NSLayoutConstraint.activate([
            detailsLable.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            detailsLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fileBrowserBtn.bottomAnchor.constraint(equalTo: detailsLable.topAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(greaterThanOrEqualTo: detailsLable.bottomAnchor)
        ])
    }
    
    @objc private func openFileBrowser() {
        let picker = DocumentPickerViewController { [weak self] filePath in
            print("selected file path: \(filePath)")
            self?.detailsLable.text = filePath
        }
        present(picker, animated: true)
    }
}

