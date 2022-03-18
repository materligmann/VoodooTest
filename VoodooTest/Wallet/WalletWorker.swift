//
//  WalletWorker.swift
//  VoodooTest
//
//  Created by Mathias Erligmann on 18/03/2022.
//

import Foundation
import Web3
import Web3ContractABI
import Web3PromiseKit

class WalletWorker {
    
    func fetchItem(completion: @escaping ([Item]) -> Void) {
        let infuraMumbaiURL = "https://polygon-mumbai.infura.io/v3/2173980a55e54e20ad7bb4bef5a93061"
        
        let client = Web3(rpcURL: infuraMumbaiURL).eth
        if let leafAddress = try? EthereumAddress(hex: "0x9Bfe99fEc1c11Ad4C657A5D12A1c1c61E6FFE30A", eip55: true) {
            let leafContract = GenericERC20Contract(address: leafAddress, eth: client)
            if let address = Persistance.getCurrentAddress(),
               let addressCreator = try? EthereumAddress(hex: address, eip55: true) {
                firstly {
                    leafContract.balanceOf(address: addressCreator).call()
                }.done { outputs in
                    if let leafNumber = outputs["_balance"] as? BigUInt {
                        completion([Item(name: "Water", number: 3, image: "drop.fill"),
                                    Item(name: "Leaf", number: Int(leafNumber), image: "leaf.fill")])
                    } else {
                        completion([Item(name: "Water", number: 3, image: "drop.fill"),
                                    Item(name: "Leaf", number: 0, image: "leaf.fill")])
                    }
                }.catch { error in
                    completion([Item(name: "Water", number: 3, image: "drop.fill"),
                                Item(name: "Leaf", number: 0, image: "leaf.fill")])
                }
            } else {
                completion([Item(name: "Water", number: 3, image: "drop.fill"),
                            Item(name: "Leaf", number: 0, image: "leaf.fill")])
            }
        }
        
    }
}
