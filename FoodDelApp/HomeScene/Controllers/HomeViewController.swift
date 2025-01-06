//
//  HomeViewController.swift
//  FoodDelApp
//
//  Created by user on 03.01.2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterProtocol
    
    //MARK: - Property
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let searchField = SearchField()
    private let geoMarkImage = UIImageView()
    private let geoLabel = UILabel()
    private let bigHCollectionTitle = CollectionTitle()
    private let bigVCollectionTitle = CollectionTitle()
    
    lazy var smallHCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.headerReferenceSize = .zero
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 40
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.tag = 1
        return collection
    }()
    
    lazy var bigHCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.headerReferenceSize = .zero
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.tag = 2
        return collection
    }()
    
    
    lazy var bigVCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.headerReferenceSize = .zero
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isScrollEnabled = false
        collection.tag = 3
        return collection
    }()
    
    //MARK: - Init
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
    }
}



//MARK: - Layout
extension HomeViewController {
    func setupLayout() {
        setupView()
        configureSearchField()
        configureMarkImage()
        configureMarkLabel()
        configureScrollView()
        configureContentView()
        prepareScrollView()
        setupSmallHCollection()
        configureBigHCollectionTitle()
        setupBigHCollection()
        configureBigVCollectionTitle()
        setupBigVCollection()
        calculateContentSize()
    }
    
    func setupView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
    }
    
    func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .clear
    }
    
    func configureContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
    }
    
    func prepareScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
    
    func configureSearchField() {
        contentView.addSubview(searchField)
        searchField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            searchField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            searchField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            searchField.heightAnchor.constraint(equalToConstant: 52),
        ])
    }
    
    func configureMarkImage() {
        contentView.addSubview(geoMarkImage)
        geoMarkImage.image = UIImage(resource: .pin)
        geoMarkImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            geoMarkImage.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 16),
            geoMarkImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            geoMarkImage.widthAnchor.constraint(equalToConstant: 20),
            geoMarkImage.heightAnchor.constraint(equalToConstant: 20),
        ])
        
    }
    
    func configureMarkLabel() {
        contentView.addSubview(geoLabel)
        geoLabel.translatesAutoresizingMaskIntoConstraints = false
        geoLabel.font = UIFont.systemFont(ofSize: 14)
        geoLabel.textColor = .black
        geoLabel.text = "Geo label"
        
        NSLayoutConstraint.activate([
            geoLabel.centerYAnchor.constraint(equalTo: geoMarkImage.centerYAnchor),
            geoLabel.heightAnchor.constraint(equalToConstant: 20),
            geoLabel.leadingAnchor.constraint(equalTo: geoMarkImage.trailingAnchor, constant: 8),
            geoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30)
        ])
    }
    
    func setupSmallHCollection() {
        contentView.addSubview(smallHCollection)
        smallHCollection.backgroundColor = .clear
        smallHCollection.showsHorizontalScrollIndicator = false
        smallHCollection.translatesAutoresizingMaskIntoConstraints = false
        smallHCollection.delegate = self
        smallHCollection.dataSource = self
        smallHCollection.register(SmallHCollectionCell.self, forCellWithReuseIdentifier: "SmallHCollectionCell")
        
        NSLayoutConstraint.activate([
            smallHCollection.topAnchor.constraint(equalTo: geoLabel.bottomAnchor, constant: 30),
            smallHCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            smallHCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            smallHCollection.heightAnchor.constraint(equalToConstant: 92)
        ])
    }
    
    func configureBigHCollectionTitle() {
        contentView.addSubview(bigHCollectionTitle)
        bigHCollectionTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bigHCollectionTitle.topAnchor.constraint(equalTo: smallHCollection.bottomAnchor, constant: 30),
            bigHCollectionTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            bigHCollectionTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            bigHCollectionTitle.heightAnchor.constraint(equalToConstant: 22),
        ])
    }
    
    func setupBigHCollection() {
        contentView.addSubview(bigHCollection)
        bigHCollection.backgroundColor = .red
        
        bigHCollection.translatesAutoresizingMaskIntoConstraints = false
        bigHCollection.delegate = self
        bigHCollection.dataSource = self
        bigHCollection.register(BigHCollectionViewCell.self, forCellWithReuseIdentifier: "BigHCollectionCell")
        
        NSLayoutConstraint.activate([
            bigHCollection.topAnchor.constraint(equalTo: bigHCollectionTitle.bottomAnchor, constant: 30),
            bigHCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            bigHCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bigHCollection.heightAnchor.constraint(equalToConstant: 132 * 2 + 20)
        ])
    }
    
    func configureBigVCollectionTitle() {
        contentView.addSubview(bigVCollectionTitle)
        bigVCollectionTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bigVCollectionTitle.topAnchor.constraint(equalTo: bigHCollection.bottomAnchor, constant: 30),
            bigVCollectionTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            bigVCollectionTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            bigVCollectionTitle.heightAnchor.constraint(equalToConstant: 22),
        ])
    }
    
    func setupBigVCollection() {
        contentView.addSubview(bigVCollection)
        bigVCollection.backgroundColor = .red
        
        bigVCollection.translatesAutoresizingMaskIntoConstraints = false
        bigVCollection.delegate = self
        bigVCollection.dataSource = self
        bigVCollection.register(BigVCollectionViewCell.self, forCellWithReuseIdentifier: "BigVCollectionCell")
        
        NSLayoutConstraint.activate([
            bigVCollection.topAnchor.constraint(equalTo: bigVCollectionTitle.bottomAnchor, constant: 30),
            bigVCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            bigVCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            bigVCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bigVCollection.heightAnchor.constraint(equalToConstant: 1000)
        ])
    }
    
    func calculateContentSize() {
        var totalHeight: CGFloat = 300 + 50 + 50 + 22 + 22 + 30 + 30 + smallHCollection.bounds.height + bigHCollection.bounds.height
        
        for index in 0..<bigVCollection.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: index, section: 0)
            let cellHeight = collectionView(bigVCollection, layout: bigVCollection.collectionViewLayout, sizeForItemAt: indexPath).height
            totalHeight += cellHeight
        }
        let spacing = CGFloat(bigVCollection.numberOfItems(inSection: 0) - 1) * 30
        contentView.heightAnchor.constraint(equalToConstant: totalHeight + spacing).isActive = true
    }
}


//MARK: - CollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 1:
            return presenter.categoryData.count
        case 2:
            return 15
        case 3:
            return 20
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
        case 1:
            let category = presenter.categoryData[indexPath.row]
            print("Creating cell for category: \(category.rawValue)")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallHCollectionCell", for: indexPath) as? SmallHCollectionCell
            cell?.configure(with: category)
            return cell ?? UICollectionViewCell()
            
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigHCollectionCell", for: indexPath)
            return cell
            
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigVCollectionCell", for: indexPath)
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case 1:
            let cell = collectionView.cellForItem(at: indexPath) as? SmallHCollectionCell
            cell?.toggleSelected()
            
        case 2:
            print(#function)
        case 3:
            print(#function)
        default:
            print(#function)
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 1:
            return CGSize(width: 70, height: 92)
        case 2:
            return CGSize(width: 130, height: 132)
        case 3:
            let width = collectionView.bounds.width
            let height = 130.0
            return CGSize(width: width, height: height)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
}
