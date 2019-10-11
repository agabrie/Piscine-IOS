import Foundation

class Deck:NSObject{
    var cards:[Card] = []
    var discards:[Card] = []
    var outs:[Card] = []
    
    static let allSpades:[Card] = Value.allValues.map({Card(c:Color.Spade, v:$0)});
    static let allDiamonds:[Card] = Value.allValues.map({Card(c:Color.Diamond, v:$0)});
    static let allClubs:[Card] = Value.allValues.map({Card(c:Color.Club, v:$0)});
    static let allHearts:[Card] = Value.allValues.map({Card(c:Color.Heart, v:$0)});
    static let allCards:[Card] = allSpades+allDiamonds+allHearts+allClubs
    
    init(_ sorted:Bool){
        cards = Deck.allCards
        if(!sorted){
            cards.shuffle()
        }
    }

}
extension Array {
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        //How many times it's shuffled
        for _ in 0..<self.count
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
extension Deck{
    override var description:String{
        return cards.map({"\($0)"}).joined(separator:",\n")
    }
    func draw() -> Card?{
        let card:Card = cards.removeFirst()
        outs.append(card)
        return card
    }
    func fold(c card:Card){
        for index in 0...outs.count{
            if(outs[index] == card){
                discards.append(outs.remove(at:index))
                return;
            }
        }
    }
}