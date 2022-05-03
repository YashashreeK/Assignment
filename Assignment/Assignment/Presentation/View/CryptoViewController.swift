//
//  ViewController.swift
//  Assignment
//
//  Created by Yashashree on 27/04/22.
//

import UIKit

class CryptoViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 50
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        return tableView
    }()
   
    var viewModel: CryptoViewModel?
    
    static func create(with viewModel: CryptoViewModel) -> CryptoViewController{
        let vc = CryptoViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setConstraint()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.fetchCryptoDetails(offset: "0")
    }
    
    private func setup() {
        self.view.backgroundColor = .black
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        let view = TableViewHeader()
        view.tag = 101
        view.delegate = self
        view.backgroundColor = .black
        view.frame = CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 100)
        tableView.tableHeaderView = view
        bind()
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10)
        ])
    }
    
    private func bind(){
        viewModel?.arrDetails.observe(on: self, observerBlock: {
            [weak self] _ in self?.reload()
        })
    }
    
    private func reload() {
        DispatchQueue.main.async {[weak self] in
            self?.tableView.reloadData()
        }
    }
}

//MARK:- UITABLEVIEW METHODS
extension CryptoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.arrDetails.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        if let data = viewModel?.arrDetails.value[indexPath.row] {
            let rank = data.rank ?? "\(indexPath.row + 1)"
            let name  = data.name ?? ""
            let percent24Hr = String(format: "%.2f", Double(data.percentage24Hrs ?? "") ?? 0.0)
            let price =  String(format: "%.2f", Double(data.price ?? "") ?? 0.0)
            cell.setValue(serialNumber: rank, name: name , percentage: percent24Hr, price: price)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
    }
}

//MARK:- TABLEVIEWHEADER DELEGATE
extension CryptoViewController: TableHeaderViewDelegate {
    func didSearchText(query: String?, isDelay: Bool) {
        viewModel?.didSearch(query: query, isDelay: isDelay)
    }
}
