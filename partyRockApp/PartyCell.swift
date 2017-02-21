//
//  PartyCellTableViewCell.swift
//  partyRockApp
//
//  Created by Evan on 2/21/17.
//  Copyright © 2017 Evan. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoImage: UIImageView!
    
    @IBOutlet weak var VideoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(partyRock: PartyRock) {
        VideoTitle.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoImage.image = UIImage(data: data)
                }
            } catch {
                //handle error
            }
        }
        
    }

}
