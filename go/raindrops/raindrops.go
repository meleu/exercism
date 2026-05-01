package raindrops

import (
	"fmt"
	"strings"
)

func Convert(number int) string {
	var result strings.Builder
	if number%3 == 0 {
		result.WriteString("Pling")
	}
	if number%5 == 0 {
		result.WriteString("Plang")
	}
	if number%7 == 0 {
		result.WriteString("Plong")
	}
	if result.String() == "" {
		return fmt.Sprint(number)
	}

	return result.String()
}
