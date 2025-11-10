// Package weather provides a method to return the condition of a given city.
package weather

// CurrentCondition stores the current condition.
var CurrentCondition string

// CurrentLocation stores the current location.
var CurrentLocation string

// Forecast returns the current condition of the given city.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
