import UIKit

class DemoTableViewCell: UITableViewCell {
  
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var WorkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
      //  self.contentView.translatesAutoresizingMaskIntoConstraints = false
//        WorkLabel.translatesAutoresizingMaskIntoConstraints = false
 //       NameLabel.translatesAutoresizingMaskIntoConstraints = false
       // DemoView.translatesAutoresizingMaskIntoConstraints = false
    }

    func SetupUI(){
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
