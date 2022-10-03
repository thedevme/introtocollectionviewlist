import UIKit

class RecipeCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: RecipeCell.self)
    
    @IBOutlet weak var lblRecipe: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
