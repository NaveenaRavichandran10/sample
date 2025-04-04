//
//  FoodViewController.swift
//  sample
//
//  Created by FCI-MAC on 23/03/25.
//

import UIKit

class FoodViewController: UIViewController {

    @IBOutlet weak var ThirdLabel: UILabel!
    @IBOutlet weak var FirstLabel: UILabel!
    @IBOutlet weak var SecondLabel: UILabel!
    @IBOutlet weak var DeliveryImageView: UIImageView!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var FoodLabel: UILabel!

    // Arrays for categories
    let spicyFoods = ["Chicken Biryani", "Spicy Chicken Rice", "Mutton Biryani", "Andhra Chicken Curry", "Prawns Masala", "Chicken 65", "Pepper Chicken", "Chettinad Chicken", "Hyderabadi Dum Biryani", "Spicy Paneer Tikka"]
    let spicyPrices: [Double] = [150, 130, 180, 160, 170, 120, 140, 160, 190, 110]

    let sweetFoods = ["Gulab Jamun", "Rasgulla", "Jalebi", "Kaju Katli", "Badam Halwa", "Mysore Pak", "Payasam", "Laddu", "Boondi", "Peda"]
    let sweetPrices: [Double] = [50, 45, 40, 70, 80, 60, 55, 50, 30, 65]

    let chatFoods = ["Pani Puri", "Bhel Puri", "Samosa Chat", "Dahi Puri", "Aloo Tikki", "Papdi Chat", "Sev Puri", "Masala Puri", "Ragda Patties", "Raj Kachori"]
    let chatPrices: [Double] = [30, 35, 40, 38, 42, 34, 32, 36, 50, 45]

    override func viewDidLoad() {
        super.viewDidLoad()
        NextButton.isHidden = true
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = UIColor(red: 0.93, green: 0.90, blue: 0.98, alpha: 1.0)


        FirstLabel.text = "Spicy"
        SecondLabel.text = "Sweets"
        ThirdLabel.text = "Chats"

        // Common style
        let labels = [FirstLabel, SecondLabel, ThirdLabel]
        for label in labels {
            label?.isUserInteractionEnabled = true
            label?.textColor = .white
            label?.textAlignment = .center
            label?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            label?.layer.cornerRadius = 20
            label?.layer.masksToBounds = true
            label?.layer.shadowColor = UIColor.black.cgColor
            label?.layer.shadowOpacity = 0.25
            label?.layer.shadowOffset = CGSize(width: 2, height: 4)
            label?.layer.shadowRadius = 4
            label?.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }

        FirstLabel.backgroundColor = UIColor(red: 0.65, green: 0.48, blue: 0.80, alpha: 1.0)
                SecondLabel.backgroundColor = UIColor(red: 0.65, green: 0.48, blue: 0.80, alpha: 1.0)
                ThirdLabel.backgroundColor = UIColor(red: 0.65, green: 0.48, blue: 0.80, alpha: 1.0)
        // Tap Gestures
        FirstLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(spicyLabelTapped)))
        SecondLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(sweetLabelTapped)))
        ThirdLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(chatsLabelTapped)))

        // Food Heading
        FoodLabel.text = "WoHoo Foodzz"
        FoodLabel.textAlignment = .center
        FoodLabel.textColor = UIColor.systemPurple
        FoodLabel.font = UIFont.boldSystemFont(ofSize: 36)

        // Next Button Style
        NextButton.setTitle("Next", for: .normal)
        NextButton.setTitleColor(.white, for: .normal)
        NextButton.backgroundColor = UIColor.systemIndigo
        NextButton.layer.cornerRadius = 12
        NextButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        NextButton.layer.shadowColor = UIColor.black.cgColor
        NextButton.layer.shadowOpacity = 0.3
        NextButton.layer.shadowOffset = CGSize(width: 2, height: 3)
        NextButton.layer.shadowRadius = 4
    }

    @objc func spicyLabelTapped() {
        animateTap(FirstLabel)
        navigateToDemoVC(with: spicyFoods, prices: spicyPrices)
    }

    @objc func sweetLabelTapped() {
        animateTap(SecondLabel)
        navigateToDemoVC(with: sweetFoods, prices: sweetPrices)
    }

    @objc func chatsLabelTapped() {
        animateTap(ThirdLabel)
        navigateToDemoVC(with: chatFoods, prices: chatPrices)
    }

    func animateTap(_ label: UILabel?) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                           label?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       }) { _ in
            UIView.animate(withDuration: 0.1) {
                label?.transform = CGAffineTransform.identity
            }
        }
    }

    func navigateToDemoVC(with items: [String] , prices: [Double]) {
        if let demoVC = storyboard?.instantiateViewController(withIdentifier: "DemoUIViewController") as? DemoUIViewController {
            demoVC.foodItems = items
            demoVC.foodPrices = prices
            navigationController?.pushViewController(demoVC, animated: true)
        }
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if let menuVC = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController {
            navigationController?.pushViewController(menuVC, animated: true)
        }
    }
}
