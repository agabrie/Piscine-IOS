enum Color:String{
	case Heart		= "♡"
	case Spade		= "♤"
	case Club		= "♧"
	case Diamond	= "♢"
}
extension Color {
	static let allColors:[Color] = [
		.Heart	,
		.Spade	,
		.Club	,
		.Diamond
	]
}

