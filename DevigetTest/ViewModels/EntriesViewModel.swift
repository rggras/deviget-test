//
//  EntriesViewModel.swift
//  DevigetTest
//
//  Created by Rodrigo Gras on 26/11/2019.
//  Copyright © 2019 Rodrigo Gras. All rights reserved.
//

import Foundation

protocol EntriesViewModelDelegate: class {
    func didGetEntries()
    func getEntriesDidFail(error: Error)
    func willGetEntries()
}

class EntriesViewModel {
    
    weak var delegate: EntriesViewModelDelegate?
    var entries: [EntryRepresentable] = []
    
    // MARK: Public Methods
    
    public func getEntries() {
        delegate?.willGetEntries()
        
        // TODO: here we should call our networking layer. Instead I'm reading a local json file
        
        guard let fileUrl = Bundle.main.url(forResource: "top", withExtension: "json") else {
            print("File doesn't exist")
            return
        }

        do {
            let jsonData = try Data(contentsOf: fileUrl)
            let decoder = JSONDecoder()

            do {
                let decodedEntries = try decoder.decode(Entries.self, from: jsonData)
                
                for entry in decodedEntries.childrens {
                    entries.append(EntryViewModel(entry: entry))
                }

                delegate?.didGetEntries()
            } catch {
                delegate?.getEntriesDidFail(error: error)
            }

        } catch {
            delegate?.getEntriesDidFail(error: error)
        }
    }
}
