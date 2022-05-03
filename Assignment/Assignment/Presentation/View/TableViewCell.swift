//
//  TableViewCell.swift
//  Assignment
//
//  Created by Yashashree on 28/04/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let identifier = "Cell"
    let viewContent: ViewCrypto = {
        let view = ViewCrypto()
        return view
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setup() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.addSubview(viewContent)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            viewContent.topAnchor.constraint(equalTo: self.topAnchor),
            viewContent.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewContent.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewContent.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setValue(serialNumber: String, name: String, percentage: String, price: String) {
        viewContent.setValue(serialNumber: serialNumber, name: name, percentage: percentage, price: price)
    }
}
