package differenceofsquares

func SquareOfSum(n int) int {
	var sum int
	for i := range n + 1 {
		sum += i
	}
	return sum * sum
}

func SumOfSquares(n int) int {
	var sum int
	for i := range n + 1 {
		sum += i * i
	}
	return sum
}

func Difference(n int) int {
	return SquareOfSum(n) - SumOfSquares(n)
}
