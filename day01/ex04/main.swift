// var cardSpades:[Card] = Deck.allSpades
// var cardHearts:[Card] = Deck.allHearts
// var cardClubs:[Card] = Deck.allClubs
// var cardDiamonds:[Card] = Deck.allDiamonds
// var cardDeck:[Card] = Deck.allCards

// cardSpades.shuffle()
// print("Spades : \n\(cardSpades)")

// cardDiamonds.shuffle()
// print("\nDiamonds : \n\(cardDiamonds)")

// cardClubs.shuffle()
// print("\nClubs : \n\(cardClubs)")

// cardHearts.shuffle()
// print("\nHearts : \n\(cardHearts)")







// cardDeck.shuffle()
// print("\nDeck : \n\(cardDeck)")

// var deck:Deck = Deck(false)
// print("deck => [\(deck)]")

// print("Card drawn => [\(deck.draw()!)]")
// print("deck=> [\(deck)]")
// print("outs=> [\(deck.outs)]")



var cardDeck:[Card] = Deck.allCards
var theDeck = Deck(true)

print("\nOriginal : ")
print("cards : ")
print(theDeck.cards)
print("outs : ")
print(theDeck.outs)
print("discards : ")
print(theDeck.discards)

var draw1 :Card = theDeck.draw()!
var draw2 :Card = theDeck.draw()!
var draw3 :Card = theDeck.draw()!

print("\nNew : ")
print("cards : ")
print(theDeck.cards)
print("outs : ")
print(theDeck.outs)
print("discards : ")
print(theDeck.discards)

theDeck.fold(c: draw1)

print("\nNew 2 : ")
print("cards : ")
print(theDeck.cards)
print("outs : ")
print(theDeck.outs)
print("discards : ")
print(theDeck.discards)

theDeck.fold(c: draw3)

print("\nNew 2 : ")
print("cards : ")
print(theDeck.cards)
print("outs : ")
print(theDeck.outs)
print("discards : ")
print(theDeck.discards)


theDeck.fold(c: draw2)

print("\nNew 2 : ")
print("cards : ")
print(theDeck.cards)
print("outs : ")
print(theDeck.outs)
print("discards : ")
print(theDeck.discards)


