//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Galina evdokimova on 27.04.2024.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
    func didLoadDataFromServer()
    func didFailToLoadData(with error: Error)
}
