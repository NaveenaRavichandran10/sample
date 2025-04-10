import UIKit

class finalpaymentViewController: UIViewController {

    @IBOutlet weak var conformationLabel: UILabel!
    @IBOutlet weak var orderprogressButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var timeshowingLabel: UILabel!
    @IBOutlet weak var tickImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Payment Confirmation"
        setupGradientBackground()
        setupConfirmationPage()
    }

    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 1.0, green: 0.92, blue: 0.85, alpha: 1.0).cgColor, // peach
            UIColor(red: 1.0, green: 0.75, blue: 0.60, alpha: 1.0).cgColor  // coral-orange
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    private func setupConfirmationPage() {
        conformationLabel.text = "Payment Successful!"
        conformationLabel.textColor = UIColor(red: 0.55, green: 0.08, blue: 0.38, alpha: 1.0) // Taste Trove purple
        conformationLabel.font = .boldSystemFont(ofSize: 28)
        conformationLabel.textAlignment = .center

        timeshowingLabel.text = "Your order will be processed in approx. 10-15 mins."
        timeshowingLabel.textColor = .darkGray
        timeshowingLabel.font = .systemFont(ofSize: 16)
        timeshowingLabel.textAlignment = .center
        timeshowingLabel.numberOfLines = 0

        tickImageView.image = UIImage(systemName: "checkmark.circle.fill")
        tickImageView.tintColor = UIColor(red: 0.86, green: 0.27, blue: 0.27, alpha: 1.0) // spicy red
        tickImageView.contentMode = .scaleAspectFit

        styleButton(orderprogressButton, title: "Track Order", color: UIColor(red: 0.86, green: 0.27, blue: 0.27, alpha: 1.0)) // spicy red
        styleButton(closeButton, title: "Close", color: UIColor(red: 0.55, green: 0.08, blue: 0.38, alpha: 1.0)) // Taste Trove purple
    }

    private func styleButton(_ button: UIButton, title: String, color: UIColor) {
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 2, height: 3)
        button.layer.shadowRadius = 4
    }

    @IBAction func orderProgressButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Order Status", message: "Your order is on the way!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    @IBAction func closeButtonTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
