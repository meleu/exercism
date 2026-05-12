package clock

import "fmt"

type Clock int

const minutesInDay = 24 * 60

func New(h, m int) Clock {
	c := Clock((h*60 + m) % minutesInDay)
	if c < 0 {
		c += minutesInDay
	}
	return c
}

func (c Clock) Add(m int) Clock {
	return New(0, int(c)+m)
}

func (c Clock) Subtract(m int) Clock {
	return New(0, int(c)-m)
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c/60, c%60)
}
