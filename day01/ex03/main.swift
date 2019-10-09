var cardSpades:[Card] = Deck.allSpades
var cardHearts:[Card] = Deck.allHearts
var cardClubs:[Card] = Deck.allClubs
var cardDiamonds:[Card] = Deck.allDiamonds
var cardDeck:[Card] = Deck.allCards

cardSpades.shuffle()
print("Spades : \n\(cardSpades)")

cardDiamonds.shuffle()
print("\nDiamonds : \n\(cardDiamonds)")

cardClubs.shuffle()
print("\nClubs : \n\(cardClubs)")

cardHearts.shuffle()
print("\nHearts : \n\(cardHearts)")

cardDeck.shuffle()
print("\nDeck : \n\(cardDeck)")
