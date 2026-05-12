// Package gigasecond should have a package comment that summarizes what it's about.
// https://golang.org/doc/effective_go.html#commentary
package gigasecond

// import path for the time package from the standard library
import "time"

const (
	giga                     = 1_000_000_000
	gigasecondsInNanoseconds = giga * time.Second
)

func AddGigasecond(t time.Time) time.Time {
	return t.Add(gigasecondsInNanoseconds)
}
