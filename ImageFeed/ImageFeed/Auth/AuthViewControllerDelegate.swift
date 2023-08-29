//
//  AuthViewControllerDelegate.swift
//  ImageFeed
//
//  Created by Fixed on 29.08.2023.
//

import Foundation

protocol AuthViewControllerDelegate: AnyObject {
    func authViewController(_ vc: AuthViewController, didAuthenticateWithCode code: String)
}
