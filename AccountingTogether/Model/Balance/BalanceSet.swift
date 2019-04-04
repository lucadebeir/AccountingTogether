//
//  BalanceSet.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 04/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit

class BalanceSet : Sequence {
    
    var set : [Balance]
    
    init(){
        self.set = []
    }
    
    init(balance : [Balance]){
        self.set = balance
    }
    
    func makeIterator() -> ItBalanceSet {
        return ItBalanceSet(balance: self)
        //return ItPersonalBalanceSet(balance : self)
    }
    
    public func isEmpty() -> Bool {
        return self.set.isEmpty
    }
    
    public func count() -> Int {
        return self.set.count
    }
    
    public func contains(_amount : Double) -> Bool {
        
        //
        return false
    }
    
    public func indexOf(b : Balance) -> Int {
        
        var i = -1
        var found = false
        
        while(!found && i < self.set.count - 1){
            //found==true ou i >= self.set.count
            i = i + 1
            found = ( self.set[i] == b )
        }
        if(found){
            return i
        }else{
            return -1
        }
        
    }
    
    
    public func remove(balance : Balance){
        self.set.remove(at: self.indexOf(b: balance))
        
    }
    
    public func add(balance : Balance) {
        if(!contains(_amount : balance.amount)){
            self.set.append(balance);
        }
    }
    
}

class ItBalanceSet: IteratorProtocol{
    
    var current_indice : Int
    var elementSet : BalanceSet
    
    init(balance : BalanceSet){
        self.current_indice=0
        self.elementSet = balance
    }
    
    func next() -> Balance? {
        
        if(self.current_indice==self.elementSet.set.count){ return nil }
        else{
            let ret = self.elementSet.set[self.current_indice]
            self.current_indice=self.current_indice + 1
            return ret
        }
        
    }
    
}

