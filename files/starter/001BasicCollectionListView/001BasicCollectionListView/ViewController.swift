import UIKit

class ViewController: UIViewController {
    
    let data = [
        "Gumbo Gumbo Gumbo Gumbo Gumbo Gumbo Gumbo Gumbo Gumbo Gumbo",
        "Crawfish Etouffee",
        "Jambalaya",
        "Beignets",
        "BBQ Shrimp",
        "Shrimp and Grits"
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var collectionViewLayout: UICollectionViewCompositionalLayout = {
        var config = UICollectionLayoutListConfiguration(appearance: .sidebarPlain)
        return UICollectionViewCompositionalLayout.list(using: config)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let cells: [RegisterableView] = [
            .nib(RecipeCell.self),
            .nib(RecipeDetailCell.self) // Example Cell Not using it
        ]
        
        collectionView.register(cells: cells)
        collectionView.dataSource = self
        collectionView.collectionViewLayout = collectionViewLayout
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCell.reuseIdentifier, for: indexPath) as! RecipeCell
        cell.lblRecipe.text = data[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
}
