import UIKit

class DemoUIViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var BgView: UIView!
    @IBOutlet weak var NameTableView: UITableView!
    
    var foodItems: [String] = []
    var foodPrices: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Available Items"
        
        setupBackground()
        setupTableView()
    }
    
    private func setupBackground() {
        view.backgroundColor = UIColor(red: 0.93, green: 0.90, blue: 0.98, alpha: 1.0) 
        BgView.backgroundColor = .white
        BgView.layer.cornerRadius = 16
        BgView.layer.shadowColor = UIColor.black.cgColor
        BgView.layer.shadowOpacity = 0.1
        BgView.layer.shadowOffset = CGSize(width: 0, height: 2)
        BgView.layer.shadowRadius = 8
    }
    
    private func setupTableView() {
        NameTableView.delegate = self
        NameTableView.dataSource = self
        NameTableView.register(UINib(nibName: "DemoTableViewCell", bundle: nil), forCellReuseIdentifier: "DemoTableViewCell")
        NameTableView.showsVerticalScrollIndicator = false
        NameTableView.separatorStyle = .none
        NameTableView.backgroundColor = .clear
    }
    
    // MARK: - UITableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        
        let name = foodItems[indexPath.row]
        let price = foodPrices[indexPath.row]
        
        cell.NameLabel.text = "\(name) - ₹\(String(format: "%.2f", price))"
        cell.NameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        cell.NameLabel.textColor = UIColor(red: 0.50, green: 0.10, blue: 0.50, alpha: 1.0) // deep purple
        
        cell.backgroundColor = UIColor(red: 1.0, green: 0.95, blue: 0.95, alpha: 1.0) // light pink
        cell.layer.cornerRadius = 12
        cell.layer.masksToBounds = true
        cell.selectionStyle = .none
        
        return cell
    }
    
    // MARK: - UITableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedName = foodItems[indexPath.row]
        let selectedPrice = foodPrices[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let menuVC = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController {
            menuVC.selectedFoodName = selectedName
            menuVC.selectedPrice = selectedPrice
            navigationController?.pushViewController(menuVC, animated: true)
        }
    }
}
