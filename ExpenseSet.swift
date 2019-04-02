//
//  ExpenseSet.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 02/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

class ExpenseSet: Sequence {
    
    var set : [Expense]
    
    init(){
        self.set = []
    }
    
    init(expenses : [Expense]){
        self.set = expenses
    }
    
    func makeIterator() -> ItExpenseSet{
        return ItExpenseSet(pers: self)
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
            found = ( self.set[i].nameE == _nameE )
        }
        return found
    }
    
    public func indexOf(e : Expense) -> Int {
        
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
    
    
    public func remove(expense : Expense){
        self.set.remove(at: self.indexOf(e: expense))
        
    }
    
    public func add(expense : Expense) {
        if(!contains(_nameE : expense.nameE)){
            self.set.append(expense)
        }
    }
    
}

class ItExpenseSet: IteratorProtocol{
    
    var current_indice : Int
    var elementSet : ExpenseSet
    
    init(pers : ExpenseSet){
        self.current_indice=0
        self.elementSet = pers
    }
    
    func next() -> Expense?{
        
        if(self.current_indice==self.elementSet.set.count){ return nil }
        else{
            let ret = self.elementSet.set[self.current_indice]
            self.current_indice=self.current_indice + 1
            return ret
        }
        
    }
    
}

