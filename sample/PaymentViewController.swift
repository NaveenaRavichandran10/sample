import UIKit

class PaymentViewController: UIViewController {
    
    @IBOutlet weak var PaymentmethodLabel: UILabel!
    @IBOutlet weak var VisauncheckButton: UIButton!
    @IBOutlet weak var PhonepeuncheckButton: UIButton!
    @IBOutlet weak var CashondeliveryuncheckButton: UIButton!
    @IBOutlet weak var PaytmuncheckButton: UIButton!
    
    @IBOutlet weak var PaytmLabel: UILabel!
    @IBOutlet weak var CashondeliveryLabel: UILabel!
    @IBOutlet weak var PhonepeLabel: UILabel!
    @IBOutlet weak var VisaLabel: UILabel!
    
    @IBOutlet weak var payButton: UIButton!
    
    var paymentButtons: [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientBackground()
        setupLabels()
        setupButtons()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let labels = [VisaLabel, PhonepeLabel, CashondeliveryLabel, PaytmLabel]
        for label in labels {
            label?.layer.cornerRadius = 12
        }
    }

    
    func setupGradientBackground() {
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

    func setupLabels() {
        PaymentmethodLabel.text = "Select Payment Method"
        PaymentmethodLabel.font = UIFont.boldSystemFont(ofSize: 24)
        PaymentmethodLabel.textColor = UIColor(red: 0.55, green: 0.08, blue: 0.38, alpha: 1.0) // Taste Trove purple
        PaymentmethodLabel.textAlignment = .center

        let labels = [VisaLabel, PhonepeLabel, CashondeliveryLabel, PaytmLabel]
        let labelTitles = ["Visa", "PhonePe", "Cash on Delivery", "Paytm"]
        
        for (index, label) in labels.enumerated() {
            label?.text = labelTitles[index]
            label?.textColor = .white
            label?.textAlignment = .center
            label?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            label?.backgroundColor = UIColor(red: 0.86, green: 0.27, blue: 0.27, alpha: 1.0) // spicy red
            label?.layer.cornerRadius = 20
            label?.layer.masksToBounds = true
            label?.layer.shadowColor = UIColor.black.cgColor
            label?.layer.shadowOpacity = 0.25
            label?.layer.shadowOffset = CGSize(width: 2, height: 4)
            label?.layer.shadowRadius = 4
        }
    }

    func setupButtons() {
        paymentButtons = [
            VisauncheckButton,
            PhonepeuncheckButton,
            CashondeliveryuncheckButton,
            PaytmuncheckButton
        ]
        
        for button in paymentButtons {
            button.setImage(UIImage(systemName: "circle"), for: .normal)
            button.tintColor = .darkGray
            button.contentHorizontalAlignment = .left
        }

        payButton.setTitle("Pay", for: .normal)
        payButton.setTitleColor(.white, for: .normal)
        payButton.backgroundColor = UIColor(red: 0.86, green: 0.27, blue: 0.27, alpha: 1.0) // spicy red
        payButton.layer.cornerRadius = 12
        payButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        payButton.layer.shadowColor = UIColor.black.cgColor
        payButton.layer.shadowOpacity = 0.3
        payButton.layer.shadowOffset = CGSize(width: 2, height: 3)
        payButton.layer.shadowRadius = 4
    }

    func selectPaymentMethod(selectedButton: UIButton) {
        for button in paymentButtons {
            let isSelected = (button == selectedButton)
            button.setImage(UIImage(systemName: isSelected ? "checkmark.circle.fill" : "circle"), for: .normal)
            button.tintColor = isSelected ? UIColor(red: 0.86, green: 0.27, blue: 0.27, alpha: 1.0) : .darkGray
        }
    }

    @IBAction func visaButtonTapped(_ sender: UIButton) {
        selectPaymentMethod(selectedButton: VisauncheckButton)
    }

    @IBAction func phonepeButtonTapped(_ sender: UIButton) {
        selectPaymentMethod(selectedButton: PhonepeuncheckButton)
    }

    @IBAction func cashOnDeliveryButtonTapped(_ sender: UIButton) {
        selectPaymentMethod(selectedButton: CashondeliveryuncheckButton)
    }

    @IBAction func paytmButtonTapped(_ sender: UIButton) {
        selectPaymentMethod(selectedButton: PaytmuncheckButton)
    }

    @IBAction func payButtonTapped(_ sender: UIButton) {
        print("Tapped")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let finalVC = storyboard.instantiateViewController(withIdentifier: "finalpaymentViewController") as? finalpaymentViewController {
            self.navigationController?.pushViewController(finalVC, animated: true)
        }
    }
}
