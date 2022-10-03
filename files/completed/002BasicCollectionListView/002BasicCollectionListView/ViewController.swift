import UIKit

class ViewController: UIViewController {
    let data = [
        "Example 1",
        "Example 2",
        "Example 3",
        "Example 4",
        "Example 5",
        "Example 6",
        "Example 7",
        "Example 8",
        "Example 9",
        "Example 10"
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var collectionViewLayout: UICollectionViewCompositionalLayout = {
        var config = UICollectionLayoutListConfiguration(appearance: .plain)
        return UICollectionViewCompositionalLayout.list(using: config)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialze()
    }
    
    func initialze() {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let cells: [RegisterableView] = [
            .nib(NameCell.self)
        ]
        
        collectionView.register(cells: cells)
        collectionView.dataSource = self
        collectionView.collectionViewLayout = collectionViewLayout
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NameCell", for: indexPath) as! NameCell
        cell.lblName.text = data[indexPath.row]
        
        return cell
    }
}

