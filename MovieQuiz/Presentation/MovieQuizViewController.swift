import UIKit
final class MovieQuizViewController: UIViewController, MovieQuizViewControllerProtocol {
    
    
    // MARK: - Lifecycle
    
    private var presenter: MovieQuizPresenter!
    
    private var alertPresenter: AlertPresenter?
    
    @IBOutlet private var imageView: UIImageView!
    
    @IBOutlet private var textLabel: UILabel!
    
    @IBOutlet private var counterLabel: UILabel!
    
    @IBOutlet private var questionLabel: UILabel!
    
    @IBOutlet private var noButton: UIButton!
    
    @IBOutlet private var yesButton: UIButton!
    
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MovieQuizPresenter(viewController: self)
        imageView.layer.cornerRadius = 20
        showLoadingIndicator()
        textLabel.font = UIFont(
            name: "YSDisplay-Bold",
            size: 23)
        questionLabel.font = UIFont(
            name: "YSDisplay-Medium",
            size: 20)
        counterLabel.font = UIFont(
            name: "YSDisplay-Medium",
            size: 20)
        noButton.titleLabel?.font = UIFont(
            name: "YSDisplay-Medium",
            size: 20)
        yesButton.titleLabel?.font = UIFont(
            name: "YSDisplay-Medium",
            size: 20)
        yesButton.isEnabled = true
        noButton.isEnabled = true
    }
    func highLightImageBorder(isCorrectAnswer: Bool) {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrectAnswer ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
    }
    func showLoadingIndicator() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    func hideLoadingIndicator() {
        activityIndicator.isHidden = true
    }
    func showNetworkError(message: String) {
        hideLoadingIndicator()
        let alert = UIAlertController(
                    title: "Ошибка",
                    message: message,
                    preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Попробовать ещё раз",
                                           style: .default) { [weak self] _ in
                    guard let self = self else { return }
                    
                    self.presenter.restartGame()
        }
        alert.addAction(action)
    }
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        presenter.noButtonClicked()
        noButton.isEnabled = false
    }
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        presenter.yesButtonClicked()
        yesButton.isEnabled = false
    }
    func show(quiz step: QuizStepViewModel) {
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
        imageView.layer.borderWidth = 0
        yesButton.isEnabled = true
        noButton.isEnabled = true
    }
    func show(quiz result: QuizResultsViewModel) {
        let message = presenter.makeResultsMessage()
        let alert = UIAlertController(
            title: result.title,
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(title: result.buttonText, style: .default) { [weak self] _ in
            guard let self else { return }
            self.presenter.restartGame()
        }
            alert.addAction(action)
            alert.view.accessibilityIdentifier = "Game result"
            self.present(alert, animated: true, completion: nil)
        yesButton.isEnabled = true
        noButton.isEnabled = true
        }
}
/*
 Mock-данные
 
 
 Картинка: The Godfather
 Настоящий рейтинг: 9,2
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: The Dark Knight
 Настоящий рейтинг: 9
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: Kill Bill
 Настоящий рейтинг: 8,1
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: The Avengers
 Настоящий рейтинг: 8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: Deadpool
 Настоящий рейтинг: 8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: The Green Knight
 Настоящий рейтинг: 6,6
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: Old
 Настоящий рейтинг: 5,8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
 
 
 Картинка: The Ice Age Adventures of Buck Wild
 Настоящий рейтинг: 4,3
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
 
 
 Картинка: Tesla
 Настоящий рейтинг: 5,1
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
 
 
 Картинка: Vivarium
 Настоящий рейтинг: 5,8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
*/
