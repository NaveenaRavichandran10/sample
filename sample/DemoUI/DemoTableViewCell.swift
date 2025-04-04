import UIKit

class DemoTableViewCell: UITableViewCell {
    @IBOutlet weak var WorkLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var DemoView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        SetupUI()

    }
    func SetupUI(){
        NameLabel.text = "Navee"
        NameLabel.textColor = UIColor.black
        WorkLabel.text = "IOS DEveloper"
        WorkLabel.textColor = UIColor.black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
