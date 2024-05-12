//
//  AlertPresenterProtocol.swift
//  MovieQuiz
//
//  Created by Galina evdokimova on 01.05.2024.
//

import Foundation

protocol AlertPresenterProtocol: AnyObject {
    func showAlert(model result: AlertModel)
}
