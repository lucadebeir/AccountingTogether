//
//  TravellerSet.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 02/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

class TravellerSet: Sequence {
    
    var set : [Traveller]
    
    init(){
        self.set = []
    }
    
    init(travellers : [Traveller]){
        self.set = travellers
    }
    
    func makeIterator() -> ItTravellerSet{
        return ItTravellerSet(pers: self)
    }
    
    public func isEmpty() -> Bool {
        return self.set.isEmpty
    }
    
    public func count() -> Int {
        return self.set.count
    }
    
    public func contains(_lastName : String) -> Bool {
        
        var i = -1
        var found = false
        
        while(!found && i < self.set.count - 1){
            //found==true ou i >= self.set.count
            i = i + 1
            found = ( self.set[i].lastName == _lastName )
        }
        return found
    }
    
    public func indexOf(t : Traveller) -> Int {
        
        var i = -1
        var found = false
        
        while(!found && i < self.set.count - 1){
            //found==true ou i >= self.set.count
            i = i + 1
            found = ( self.set[i] == t )
        }
        if(found){
            return i
        }else{
            return -1
        }
        
    }
    
    
    public func remove(traveller : Traveller){
        self.set.remove(at: self.indexOf(t: traveller))
        
    }
    
    public func add(traveller : Traveller) {
        if(!contains(_lastName : traveller.lastName)){
            self.set.append(traveller)
        }
    }
    
}

class ItTravellerSet: IteratorProtocol{
    
    var current_indice : Int
    var elementSet : TravellerSet
    
    init(pers : TravellerSet){
        self.current_indice=0
        self.elementSet = pers
    }
    
    func next() -> Traveller?{
        
        if(self.current_indice==self.elementSet.set.count){ return nil }
        else{
            let ret = self.elementSet.set[self.current_indice]
            self.current_indice=self.current_indice + 1
            return ret
        }
        
    }
    
}
