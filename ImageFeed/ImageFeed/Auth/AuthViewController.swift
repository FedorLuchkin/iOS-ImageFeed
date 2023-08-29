//
//  AuthViewController.swift
//  ImageFeed
//
//  Created by Fixed on 28.08.2023.
//

import UIKit

final class AuthViewController: UIViewController {
    private let ShowWebViewSegueIdetifier = "ShowWebView"
    weak var delegate: AuthViewControllerDelegate?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == ShowWebViewSegueIdetifier {
                guard let webViewViewController = segue.destination as? WebViewViewController else {
                    fatalError("Failed to prepare for \(ShowWebViewSegueIdetifier)")
                }
                webViewViewController.delegate = self
            } else {
                super.prepare(for: segue, sender: sender)
            }
        }
    }

    //MARK: - WebViewViewControllerDelegate
    extension AuthViewController: WebViewViewControllerDelegate {
        func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String) {
            delegate?.authViewController(self, didAuthenticateWithCode: code)
        }
        
        func webViewViewControllerDidCancel(_ vc: WebViewViewController) {
            dismiss(animated: true)
        }
}