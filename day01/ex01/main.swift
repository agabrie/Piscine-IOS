let card1 = Card(c : Color.Spade, v : Value.Ace)
let card2 = Card(c : Color.Diamond, v : Value.Two)
let card3 = Card(c : Color.Diamond, v : Value.Two)

print(card1)
print(card2)
print(card3)

print(card1 == card2)
print(card3 == card2)