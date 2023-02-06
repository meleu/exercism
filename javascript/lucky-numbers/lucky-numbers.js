// @ts-check

/**
 * Calculates the sum of the two input arrays.
 *
 * @param {number[]} array1
 * @param {number[]} array2
 * @returns {number} sum of the two arrays
 */
export function twoSum(array1, array2) {
  return Number(array1.join('')) + Number(array2.join(''));
}

/**
 * Checks whether a number is a palindrome.
 *
 * @param {number} value
 * @returns {boolean} whether the number is a palindrome or not
 */
export function luckyNumber(value) {
  const reversedArrayOfDigits = [...String(value)].reverse();
  const reversedNumber = Number(reversedArrayOfDigits.join(''));
  
  return value === reversedNumber;
}

/**
 * Determines the error message that should be shown to the user
 * for the given input value.
 *
 * @param {string|null|undefined} input
 * @returns {string} error message
 */
export function errorMessage(input) {
  if ([null, undefined, ''].includes(input)) {
    return 'Required field'
  }

  const inputNumber = Number(input);
  
  if (isNaN(inputNumber) || inputNumber === 0) {
    return 'Must be a number besides 0';
  }
  
  return '';
}
