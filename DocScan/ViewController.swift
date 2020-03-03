//
//  ViewController.swift
//  DocScan
//
//  Created by RaulF on 27/02/2020.
//  Copyright © 2020 ImTech. All rights reserved.
//

import UIKit
import VisionKit

class ViewController: UIViewController {
    
    private var scanButton = ScanButton(frame: .zero)
    private var scanImageView = ScanImageView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }

    
    private func configure() {
        view.addSubview(scanImageView)
        view.addSubview(scanButton)
        
        NSLayoutConstraint.activate([
            scanButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            scanButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            scanButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            scanButton.heightAnchor.constraint(equalToConstant: 50),
            
            scanImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            scanImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            scanImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            scanImageView.bottomAnchor.constraint(equalTo: scanButton.topAnchor, constant: 16)
        ])
        
        scanButton.addTarget(self, action: #selector(scanDocument), for: .touchUpInside)
    }
    
    
    @objc private func scanDocument() {
        let scanVC = VNDocumentCameraViewController()
        scanVC.delegate = self
        present(scanVC, animated: true)
    }
}


extension ViewController: VNDocumentCameraViewControllerDelegate {
    
}

