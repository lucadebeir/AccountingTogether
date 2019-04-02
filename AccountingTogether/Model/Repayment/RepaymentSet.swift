//
//  RepaymentSet.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 02/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

class RepaymentSet: Sequence {
    
    var set : [Repayment]
    
    init(){
        self.set = []
    }
    
    init(repayments : [Repayment]){
        self.set = repayments
    }
    
    func makeIterator() -> ItRepaymentSet{
        return ItRepaymentSet(pers: self)
    }
    
    public func isEmpty() -> Bool {
        return self.set.isEmpty
    }
    
    public func count() -> Int {
        return self.set.count
    }
    
    public func contains(_nameE : String) -> Bool {
        
        var i = -1
        var found = false
        
        while(!found && i < self.set.count - 1){
            //found==true ou i >= self.set.count
            i = i + 1
            found = ( self.set[i].nameR == _nameE )
        }
        return found
    }
    
    public func indexOf(e : Repayment) -> Int {
        
        var i = -1
        var found = false
        
        while(!found && i < self.set.count - 1){
            //found==true ou i >= self.set.count
            i = i + 1
            found = ( self.set[i] == e )
        }
        if(found){
            return i
        }else{
            return -1
        }
        
    }
    
    
    public func remove(repayment : Repayment){
        self.set.remove(at: self.indexOf(e: repayment))
        
    }
    
    public func add(repayment : Repayment) {
        if(!contains(_nameE : repayment.nameR)){
            self.set.append(repayment)
        }
    }
    
}

class ItRepaymentSet: IteratorProtocol{
    
    var current_indice : Int
    var elementSet : RepaymentSet
    
    init(pers : RepaymentSet){
        self.current_indice=0
        self.elementSet = pers
    }
    
    func next() -> Repayment?{
        
        if(self.current_indice==self.elementSet.set.count){ return nil }
        else{
            let ret = self.elementSet.set[self.current_indice]
            self.current_indice=self.current_indice + 1
            return ret
        }
        
    }
    
}

