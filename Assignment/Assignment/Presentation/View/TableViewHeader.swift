//
//  TableViewHeader.swift
//  Assignment
//
//  Created by Yashashree on 29/04/22.
//

import UIKit

protocol TableHeaderViewDelegate {
    func didSearchText(query: String?, isDelay: Bool)
}

class TableViewHeader: UIView {
    
    let viewContent: ViewCrypto = {
        let view = ViewCrypto(serialNumber: "#", name: "Name", percentage: "24h", price: "Price")
        return view
    }()
    
    let vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search Crypto"
        searchBar.barStyle = .black
        return searchBar
    }()
    
    var delegate: TableHeaderViewDelegate?
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        vStackView.addArrangedSubview(searchBar)
        vStackView.addArrangedSubview(viewContent)
        self.addSubview(vStackView)
        
        searchBar.searchTextField.delegate = self
        searchBar.delegate = self
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: self.topAnchor),
            vStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            vStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            vStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

//MARK:- SEARCH DELEGATE
extension TableViewHeader: UISearchBarDelegate, UITextFieldDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.didSearchText(query: searchBar.text, isDelay: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        delegate?.didSearchText(query: searchBar.text, isDelay: false)
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        searchBar.resignFirstResponder()
        delegate?.didSearchText(query: searchBar.text, isDelay: false)
        return true
    }
    
}
