//
//  viewController.swift
//  MovieQuizTest
//
//  Created by Galina evdokimova on 24.05.2024.
//

import XCTest
@testable import MovieQuiz
final class MovieQuizViewControllerMock: MovieQuizViewControllerProtocol {
    func show(quiz step: QuizStepViewModel) {
        
    }
    func show(quiz result: QuizResultsViewModel) {
        
    }
    func highLightImageBorder(isCorrectAnswer: Bool) {
        
    }
    func showLoadingIndicator() {
        
    }
    func hideLoadingIndicator() {
        
    }
    func showNetworkError(message: String) {
        
    }
    
}
