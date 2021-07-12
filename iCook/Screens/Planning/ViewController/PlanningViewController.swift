//
//  PlanningViewController.swift
//  iCook
//
//  Created by Hunter Soares do Carmo on 10/07/21.
//

import UIKit
import CollectionPickerView
import Foundation
import QuartzCore

extension UIImage {
  func resizeImage(targetSize: CGSize) -> UIImage {
    let size = self.size
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    let newSize = widthRatio > heightRatio ?  CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    self.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return newImage!
  }
}

class PlanningViewController: UIViewController {
 
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var tittlePlanning: UILabel!
    @IBOutlet weak var pickerView: CollectionPickerView!
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var gamificationNotification: UIView!
    @IBOutlet weak var lineSelection: UIImageView!
    @IBOutlet weak var notificationOfTheDay: UIView!
    @IBOutlet weak var notficationIcon: UIImageView!
    @IBOutlet weak var copyPlanningNotification: UIImageView!
    
    let titles = ["D", "S", "T", "Q", "Q", "S", "S", "D", "S", "T"]
   
    
    let font = UIFont(name: "HelveticaNeue", size: 13)!
    let highlightedFont = UIFont(name: "HelveticaNeue", size: 20)!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //editButton.translatesAutoresizingMaskIntoConstraints = false
        //editButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 180).isActive = true
        self.ScrollView.contentSize = contentView.bounds.size
        self.lineSelection.image = UIImage(named: "Selector")
        self.notficationIcon.image = UIImage(named: "Bread")
        self.copyPlanningNotification.image = UIImage(named: "planejamento")
        gamificationNotification.layer.cornerRadius = 20
        notificationOfTheDay.layer.cornerRadius = 20
        gamificationNotification.layer.masksToBounds = true
        pickerView.dataSource = self
        pickerView.delegate = self
        
        pickerView.collectionView.reloadData()
        pickerView.collectionView.register(
            CollectionPickerViewCell.self,
            forCellWithReuseIdentifier: NSStringFromClass(CollectionPickerViewCell.self))
        
    
        pickerView.isFlat = true
        pickerView.cellSpacing = 2
        pickerView.cellSize = 50
        pickerView.maskDisabled = true
        pickerView.reloadData()
        
        
    }
    
    fileprivate func sizeForString(_ string: NSString) -> CGSize {
        let size = string.size(withAttributes: [NSAttributedString.Key.font: self.font])
        let highlightedSize = string.size(withAttributes: [NSAttributedString.Key.font: self.highlightedFont])
        return CGSize(
            width: ceil(max(size.width, highlightedSize.width)),
            height: ceil(max(size.height, highlightedSize.height)))
    }
    
   
}

extension PlanningViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //NSLog("SCROLL: \(scrollView.contentOffset.x)")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        
        NSLog("Selected item: \(titles[index])")
    }
}

// MARK: UICollectionViewDataSource
extension PlanningViewController: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(CollectionPickerViewCell.self), for: indexPath) as! CollectionPickerViewCell
        let title = titles[indexPath.item]
        
        cell.label.text = title
        cell.label.font = font
        cell.font = font
        cell.highlightedFont = highlightedFont
        
        return cell
    }
}


private class CollectionPickerViewCell: UICollectionViewCell {
    var label: UILabel!
    var imageView: UIImageView!
    var spon: UIImageView!
    var labelTeste: UILabel!
    var font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
    var highlightedFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
    override var isSelected: Bool {
        didSet {
            let animation = CATransition()
            animation.type = CATransitionType.fade
            animation.duration = 0.15
            self.label.layer.add(animation, forKey: "")
            self.label.font = self.isSelected ? self.highlightedFont : self.font
        }
    }
    
    func initialize() {
        
        
        self.layer.isDoubleSided = false
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
        
        
        
        self.label = UILabel()
        self.label.translatesAutoresizingMaskIntoConstraints = false

        self.label.backgroundColor = UIColor.clear
        self.label.textAlignment = .center
        self.label.textColor = UIColor.gray
        self.label.numberOfLines = 1
        self.label.lineBreakMode = .byTruncatingTail
        self.label.highlightedTextColor = UIColor.black
        self.label.font = self.font
//        self.label.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleBottomMargin, .flexibleRightMargin]
        self.contentView.addSubview(self.label)
        
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        
        
        
        self.spon = UIImageView()
        self.spon.image = UIImage(named: "0Spoon")
        self.spon.translatesAutoresizingMaskIntoConstraints = false
        self.spon.center = label.center
        self.spon.backgroundColor = UIColor.clear
       self.spon.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.contentView.addSubview(self.spon)

        spon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        spon.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
//        spon.widthAnchor.constraint(equalTo: label.widthAnchor)
//        spon.heightAnchor.constraint(equalTo: label.heightAnchor)

        
    }
    
    init() {
        super.init(frame: CGRect.zero)
        self.initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    required init!(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
}
