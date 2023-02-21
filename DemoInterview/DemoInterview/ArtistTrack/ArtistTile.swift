//
//  ArtistTile.swift
//  DemoInterview
//
//  Created by ST-MacBookpro on 21/02/23.
//

import Foundation
import UIKit

class ArtistTile: UIView {
    
    @IBOutlet var container: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
      }
      
      required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
      }
      
      private func setupView() {
         Bundle.main.loadNibNamed("ArtistTile", owner: self, options: nil)
         container.fixInView(self)
          self.layer.masksToBounds = true
      }

    
    @IBOutlet weak var artWorkImg: UIImageView!
    @IBOutlet weak var titleAndDesc: UILabel!
    
    func setProperties(artworkUrl: String, trackName: String, artistName: String, description: String,collectionPrice: Float ){
        let url = URL(string: artworkUrl)

        DispatchQueue.main.async {
            let data = try? Data(contentsOf: url!)
            self.artWorkImg.image = UIImage(data: data!)
        }

        let attributedText = NSMutableAttributedString()
        attributedText.append(NSAttributedString(string: "\(trackName)\n", attributes: [.font : UIFont.systemFont(ofSize: 30), .foregroundColor: UIColor.blue]))
        attributedText.append(NSAttributedString(string: "\(artistName)\n", attributes: [.font : UIFont.systemFont(ofSize: 26), .foregroundColor: UIColor.darkGray]))
        attributedText.append(NSAttributedString(string: "\(description)\n", attributes: [.font : UIFont.systemFont(ofSize: 17), .foregroundColor: UIColor.darkGray]))
        attributedText.append(NSAttributedString(string: "\(collectionPrice)", attributes: [.font : UIFont.systemFont(ofSize: 20)]))

        titleAndDesc.attributedText = attributedText
        
    }
}
