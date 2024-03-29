// @ts-check
//
/**
 * Determines whether or not you need a licence to operate a certain kind of vehicle.
 *
 * @param {string} kind
 * @returns {boolean} whether a license is required
 */
export function needsLicense(kind) {
  return ['car', 'truck'].includes(kind);
}

/**
 * Helps choosing between two options by recommending the one that
 * comes first in dictionary order.
 *
 * @param {string} option1
 * @param {string} option2
 * @returns {string} a sentence of advice which option to choose
 */
export function chooseVehicle(option1, option2) {
  const choice = (option1 < option2) ? option1 : option2;
  return choice + ' is clearly the better choice.'
}

/**
 * Calculates an estimate for the price of a used vehicle in the dealership
 * based on the original price and the age of the vehicle.
 *
 * @param {number} originalPrice
 * @param {number} age
 * @returns {number} expected resell price in the dealership
 */
export function calculateResellPrice(originalPrice, age) {
  let discount = 0;

  if (age < 3) {
    discount = 0.8;
  } else if (age <= 10) {
    discount = 0.7;
  } else {
    discount = 0.5;
  }
  
  return originalPrice * discount;
}
