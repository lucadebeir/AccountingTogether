//
//  TripSet.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 31/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

class TripSet: Sequence {
    
    var set : [Trip]
    
    init(){
        self.set = []
    }
    
    init(trips : [Trip]){
        self.set = trips
    }
    
    func makeIterator() -> ItTripSet{
        return ItTripSet(pers: self)
    }
    
    public func isEmpty() -> Bool {
        return self.set.isEmpty
    }
    
    public func count() -> Int {
        return self.set.count
    }
    
    public func contains(_title : String) -> Bool {
        
        var i = -1
        var found = false
        
        while(!found && i < self.set.count - 1){
            //found==true ou i >= self.set.count
            i = i + 1
            found = ( self.set[i].title == _title )
        }
        return found
    }
    
    public func indexOf(t : Trip) -> Int {
        
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
    
    
    public func remove(trip : Trip){
        self.set.remove(at: self.indexOf(t: trip))
        
    }
    
    public func add(trip : Trip) {
        if(!contains(_title : trip.title)){
            self.set.append(trip)
        }
    }
    
}

class ItTripSet: IteratorProtocol{
    
    var current_indice : Int
    var elementSet : TripSet
    
    init(pers : TripSet){
        self.current_indice=0
        self.elementSet = pers
    }
    
    func next() -> Trip?{
        
        if(self.current_indice==self.elementSet.set.count){ return nil }
        else{
            let ret = self.elementSet.set[self.current_indice]
            self.current_indice=self.current_indice + 1
            return ret
        }
        
    }
    
}
