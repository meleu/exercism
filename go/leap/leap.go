// Package leap should have a package comment that summarizes what it's about.
// https://golang.org/doc/effective_go.html#commentary
package leap

// IsLeapYear should have a comment documenting it.
func IsLeapYear(year int) bool {
	return divisibleBy4(year) && (!divisibleBy100(year) || divisibleBy400(year))
}

func divisibleBy4(year int) bool {
	return year%4 == 0
}

func divisibleBy100(year int) bool {
	return year%100 == 0
}

func divisibleBy400(year int) bool {
	return year%400 == 0
}
