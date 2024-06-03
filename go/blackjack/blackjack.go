package blackjack

// ParseCard returns the integer value of a card following blackjack ruleset.
func ParseCard(card string) int {
	switch card {
	case "ace":
		return 11
	case "two":
		return 2
	case "three":
		return 3
	case "four":
		return 4
	case "five":
		return 5
	case "six":
		return 6
	case "seven":
		return 7
	case "eight":
		return 8
	case "nine":
		return 9
	case "ten", "jack", "queen", "king":
		return 10
	}
	return 0
}

// FirstTurn returns the decision for the first turn, given two cards of the
// player and one card of the dealer.
func FirstTurn(card1, card2, dealerCard string) string {
	vDealerCard := ParseCard(dealerCard)
	sumOfCards := ParseCard(card1) + ParseCard(card2)

	switch {
	case isPairOfAces(card1, card2):
		return "P"
	case isBlackjack(card1, card2) && isTenOrMore(dealerCard):
		return "S"
	case isBlackjack(card1, card2) && !isTenOrMore(dealerCard):
		return "W"
	case sumOfCards >= 17 && sumOfCards <= 20:
		return "S"
	case sumOfCards >= 12 && sumOfCards <= 16 && vDealerCard < 7:
		return "S"
	}
	return "H"
}

func isPairOfAces(card1, card2 string) bool {
	return card1 == "ace" && card1 == card2
}

func isBlackjack(card1, card2 string) bool {
	return (ParseCard(card1) + ParseCard(card2)) == 21
}

func isTenOrMore(card string) bool {
	return ParseCard(card) >= 10
}
