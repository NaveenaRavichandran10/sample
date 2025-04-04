//
//  SearchViewController.swift
//  sample
//
//  Created by FCI-MAC on 29/03/25.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var FriedriceImageView: UIImageView!
    @IBOutlet weak var BiriyaniImageView: UIImageView!
    @IBOutlet weak var GravyImageView: UIImageView!
    @IBOutlet weak var QuantityLabel: UILabel!
    @IBOutlet weak var QuantitySlider: UISlider!
    @IBOutlet weak var SouthtittleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.93, green: 0.90, blue: 0.98, alpha: 1.0)
        QuantitySlider.value = 1
                QuantityLabel.text = "Quantity: \(Int(QuantitySlider.value))"
                
                // Rename label to "South Dishes"
                SouthtittleLabel.text = "South Dishes"
                
                // Add target to handle slider value change
                QuantitySlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
            }

            @objc func sliderValueChanged(_ sender: UISlider) {
                let quantity = Int(sender.value)
                QuantityLabel.text = "Quantity: \(quantity)"
            }
        }

        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


