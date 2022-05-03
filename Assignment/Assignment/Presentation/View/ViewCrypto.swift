//
//  ViewCrypto.swift
//  Assignment
//
//  Created by Yashashree on 28/04/22.
//

import UIKit

class ViewCrypto: UIView {

    let lblSrNo: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .clear
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .gray
        lbl.font = Font.regular.of(size: 15)
        return lbl
    }()
    
    let lblName: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .clear
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .gray
        lbl.textAlignment = .left
        lbl.font = Font.regular.of(size: 15)
        return lbl
    }()
    
    let lbl24h: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .clear
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .gray
        lbl.textAlignment = .right
        lbl.font = Font.regular.of(size: 15)
        return lbl
    }()
    
    let lblPrice: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .clear
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .gray
        lbl.textAlignment = .right
        lbl.font = Font.regular.of(size: 15)
        return lbl
    }()
    
    let hStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.distribution = .fillProportionally
        return stackview
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    init(serialNumber: String, name: String, percentage: String, price: String) {
        super.init(frame: .zero)
        setup()
        setValue(serialNumber: serialNumber, name: name, percentage: percentage, price: price)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        hStackView.addArrangedSubview(lblSrNo)
        hStackView.addArrangedSubview(lblName)
        hStackView.addArrangedSubview(lbl24h)
        hStackView.addArrangedSubview(lblPrice)
        self.addSubview(hStackView)
        
        setConstraint()
    }

    private func setConstraint() {
        NSLayoutConstraint.activate([
            hStackView.topAnchor.constraint(equalTo: self.topAnchor),
            hStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            hStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            lblSrNo.widthAnchor.constraint(equalToConstant: 25),
            lblPrice.widthAnchor.constraint(equalToConstant: 80),
            lbl24h.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setValue(serialNumber: String, name: String, percentage: String, price: String) {
        lblSrNo.text = serialNumber
        lblName.text = name
        lbl24h.text = percentage
        lblPrice.text = price
    }
    
}


