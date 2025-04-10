import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var FoodnameTextField: UITextField!
    @IBOutlet weak var OrderButton: UIButton!
    @IBOutlet weak var OfferLabel: UILabel!
    @IBOutlet weak var QuantitySlider: UISlider!
    @IBOutlet weak var QuantityLabel: UILabel!
    @IBOutlet weak var DataLabel: UILabel!
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var costLabel: UILabel!
    
    var selectedFoodName: String?
    var selectedPrice: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        QuantitySlider.value = 1
        QuantityLabel.text = "Quantity: \(Int(QuantitySlider.value))"
        QuantitySlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
    
    func setupUI() {
        // Gradient background to reflect vibrant food tones
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 1.0, green: 0.92, blue: 0.85, alpha: 1.0).cgColor, // peach
            UIColor(red: 1.0, green: 0.75, blue: 0.60, alpha: 1.0).cgColor  // coral-orange
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)

        // Food name field
        FoodnameTextField.borderStyle = .roundedRect
        FoodnameTextField.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        FoodnameTextField.textColor = UIColor.darkText
        FoodnameTextField.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        FoodnameTextField.layer.shadowColor = UIColor.black.cgColor
        FoodnameTextField.layer.shadowOpacity = 0.2
        FoodnameTextField.layer.shadowOffset = CGSize(width: 1, height: 2)
        FoodnameTextField.layer.shadowRadius = 3

        if let name = selectedFoodName, let price = selectedPrice {
            FoodnameTextField.text = "\(name) - ₹\(String(format: "%.2f", price))"
        }

        // Quantity Label
        QuantityLabel.textColor = UIColor.brown
        QuantityLabel.font = UIFont.boldSystemFont(ofSize: 18)
        QuantityLabel.textAlignment = .center

        // Data Label
        DataLabel.text = " "
        DataLabel.textAlignment = .center
        DataLabel.textColor = UIColor.darkGray
        DataLabel.font = UIFont.systemFont(ofSize: 16)

        // Offer Label
        OfferLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        OfferLabel.textAlignment = .center

        // Cost Label
        costLabel.textAlignment = .center
        costLabel.font = UIFont(name: "AvenirNext-Bold", size: 20)
        costLabel.textColor = UIColor(red: 0.55, green: 0.08, blue: 0.38, alpha: 1.0) // Taste Trove purple

        // Done Button
        styleButton(DoneButton, color: UIColor(red: 0.86, green: 0.27, blue: 0.27, alpha: 1.0), title: "Done")

        // Order Button
        styleButton(OrderButton, color: UIColor(red: 0.86, green: 0.27, blue: 0.27, alpha: 1.0), title: "Order")
    }

    
    func styleButton(_ button: UIButton, color: UIColor, title: String) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = color
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 2, height: 3)
        button.layer.shadowRadius = 4
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        let quantity = Int(sender.value)
        QuantityLabel.text = "Quantity: \(quantity)"
        
        if let name = selectedFoodName {
            DataLabel.text = "Food: \(name), Quantity: \(quantity)"
            DataLabel.textColor = .black
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        let quantity = Int(QuantitySlider.value)
        
        guard let name = selectedFoodName, let price = selectedPrice else {
            DataLabel.text = "Please select a valid food item"
            DataLabel.textColor = .red
            OfferLabel.text = ""
            costLabel.text = ""
            return
        }
        
        let subtotal = price * Double(quantity)
        var discount: Double = 0.0
        
        if quantity >= 2 && quantity <= 5 {
            discount = 0.20
            OfferLabel.text = "20% offer"
            OfferLabel.textColor = .systemGreen
        } else if quantity >= 6 && quantity <= 10 {
            discount = 0.50
            OfferLabel.text = "50% offer"
            OfferLabel.textColor = .systemOrange
        } else if quantity > 10 {
            discount = 0.70
            OfferLabel.text = "70% offer"
            OfferLabel.textColor = .systemRed
        } else {
            OfferLabel.text = "No offer available"
            OfferLabel.textColor = .darkGray
        }
        
        let discountAmount = subtotal * discount
        let finalTotal = subtotal - discountAmount
        
        DataLabel.text = "Food: \(name), Quantity: \(quantity)"
        DataLabel.textColor = .black
        
        costLabel.text = "Total: ₹\(String(format: "%.2f", finalTotal))"
    }
    
    @IBAction func OrderButtonTapped(_ sender: UIButton) {
        if let menuVC = storyboard?.instantiateViewController(withIdentifier: "PaymentViewController") as? PaymentViewController {
            navigationController?.pushViewController(menuVC, animated: true)
        }
    }
}
