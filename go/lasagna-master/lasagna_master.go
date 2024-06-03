package lasagna

const (
	defaultPreparationTimePerLayer = 2
	noodleGramsPerLayer            = 50
	sauceLitersPerLayer            = 0.2
	defaultServingPortions         = 2
)

func PreparationTime(layers []string, minutes int) int {
	if minutes <= 0 {
		minutes = defaultPreparationTimePerLayer
	}

	return len(layers) * minutes
}

func Quantities(layers []string) (noodleGrams int, sauceLiters float64) {
	for _, layer := range layers {
		switch layer {
		case "noodles":
			noodleGrams += noodleGramsPerLayer
		case "sauce":
			sauceLiters += sauceLitersPerLayer
		}
	}

	return noodleGrams, sauceLiters
}

func AddSecretIngredient(friendsList, myList []string) {
	secretIngredient := friendsList[len(friendsList)-1]
	myList[len(myList)-1] = secretIngredient
}

func ScaleRecipe(quantities []float64, amount int) []float64 {
	scaledQuantities := make([]float64, len(quantities))
	multiplier := float64(amount) / defaultServingPortions

	for i := 0; i < len(quantities); i++ {
		scaledQuantities[i] = quantities[i] * multiplier
	}

	return scaledQuantities
}
