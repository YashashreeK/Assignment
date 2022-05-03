//
//  CryptoViewModel.swift
//  Assignment
//
//  Created by Yashashree on 02/05/22.
//

import Foundation

protocol CryptoInputViewModel {
    func fetchCryptoDetails(offset: String)
    func didSearch(query: String?, isDelay: Bool)
}

protocol CryptoOutputViewModel {
    var arrDetails: Observable<[CryptoDetailModel]> {get}
}

protocol CryptoViewModel: CryptoInputViewModel, CryptoOutputViewModel{}

class DefaultCryptoViewModel: CryptoViewModel {
    var arrDetails: Observable<[CryptoDetailModel]> = Observable([])
   
    private let cryptoUseCase: CryptoUseCase
    private var arrOriginalDetails:[CryptoDetailModel] = []
    private var searchWorkItem: DispatchWorkItem?
    
    init(cryptoUseCase: CryptoUseCase) {
        self.cryptoUseCase = cryptoUseCase
    }
    
    func fetchCryptoDetails(offset: String) {
        cryptoUseCase.excuteCryptoDetails(limit: "20", offset: offset) {[weak self] result in
            switch result {
            case .success(let model):
                if let data = model.data{
                    self?.arrOriginalDetails.append(contentsOf: data)
                    self?.arrDetails.value.append(contentsOf: data)
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func didSearch(query: String?, isDelay: Bool) {
        searchWorkItem?.cancel()
        if isDelay {
            searchWorkItem = DispatchWorkItem {[weak self] in
                self?.filterText(text: query)
            }

            if let workItem = searchWorkItem {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: workItem)
            }
        }else {
            filterText(text: query)
        }
    }
    
    
    private func filterText(text: String?) {
        if let searchText = text, searchText.isEmpty == false {
            arrDetails.value = arrOriginalDetails.filter({($0.name ?? "").lowercased().contains(searchText.lowercased())})
            return
        }
        arrDetails.value = arrOriginalDetails
    }
}
