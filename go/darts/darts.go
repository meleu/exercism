package darts

import "math"

const (
	outerRadius  = 10
	middleRadius = 5
	innerRadius  = 1
)

func Score(x, y float64) int {
	centerDistance := math.Hypot(x, y)
	switch {
	case centerDistance <= innerRadius:
		return 10
	case centerDistance <= middleRadius:
		return 5
	case centerDistance <= outerRadius:
		return 1
	default:
		return 0
	}
}
