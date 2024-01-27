/// <reference path="./global.d.ts" />
// @ts-check

export function cookingStatus(time) {
  switch (time) {
    case 0:
      return "Lasagna is done.";
    case undefined:
      return "You forgot to set the timer.";
    default:
      return "Not done, please wait.";
  }
}

export function preparationTime(layers, time = 2) {
  return layers.length * time;
}

export function quantities(layers) {
  const noodlesQuantity = 50;
  const sauceQuantity = 0.2;
  let noodles = 0;
  let sauce = 0;

  layers.forEach((layer) => {
    noodles += layer === "noodles" ? noodlesQuantity : 0;
    sauce += layer === "sauce" ? sauceQuantity : 0;
  });

  return {
    noodles,
    sauce,
  };
}

export function addSecretIngredient(friendsList, myList) {
  myList.push(friendsList[friendsList.length - 1]);
}

export function scaleRecipe(recipe, portions) {
  const defaultPortions = 2;
  const factor = portions / defaultPortions;
  const newRecipe = {};

  for (let ingredient in recipe) {
    newRecipe[ingredient] = recipe[ingredient] * factor;
  }

  return newRecipe;
}
