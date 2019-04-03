//
//  PayForSet.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 03/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

class PayForSet: Sequence {
    
    var set : [PayFor]
    
    init(){
        self.set = []
    }
    
    init(payFor : [PayFor]){
        self.set = payFor
    }
    
    func makeIterator() -> ItPayForSet{
        return ItPayForSet(pers: self)
    }
    
    public func isEmpty() -> Bool {
        return self.set.isEmpty
    }
    
    public func count() -> Int {
        return self.set.count
    }
    
    public func contains(_amountP : Double) -> Bool {
        
        var i = -1
        var found = false
        
        while(!found && i < self.set.count - 1){
            //found==true ou i >= self.set.count
            i = i + 1
            found = ( self.set[i].priceAmount == _amountP )
        }
        return found
    }
    
    public func indexOf(p : PayFor) -> Int {
        
        var i = -1
        var found = false
        
        while(!found && i < self.set.count - 1){
            //found==true ou i >= self.set.count
            i = i + 1
            found = ( self.set[i] == p )
        }
        if(found){
            return i
        }else{
            return -1
        }
        
    }
    
    
    public func remove(payFor : PayFor){
        self.set.remove(at: self.indexOf(p: payFor))
        
    }
    
    public func add(payFor : PayFor) {
        if(!contains(_amountP: payFor.amount)){
            self.set.append(payFor)
        }
    }
    
}

class ItPayForSet: IteratorProtocol{
    
    var current_indice : Int
    var elementSet : PayForSet
    
    init(pers : PayForSet){
        self.current_indice=0
        self.elementSet = pers
    }
    
    func next() -> PayFor?{
        
        if(self.current_indice==self.elementSet.set.count){ return nil }
        else{
            let ret = self.elementSet.set[self.current_indice]
            self.current_indice=self.current_indice + 1
            return ret
        }
        
    }
    
}
