// @ts-check

/**
 * Calculates the total bird count.
 *
 * @param {number[]} birdsPerDay
 * @returns {number} total bird count
 */
export function totalBirdCount(birdsPerDay) {
  let count = 0;
  for (const birds of birdsPerDay) {
    count += birds;
  }
  return count;
}

/**
 * Calculates the total number of birds seen in a specific week.
 *
 * @param {number[]} birdsPerDay
 * @param {number} week
 * @returns {number} birds counted in the given week
 */
export function birdsInWeek(birdsPerDay, week) {
  const firstDayOfWeek = 7 * (week - 1);
  const lastDayOfWeek = firstDayOfWeek + 6;
  let count = 0;

  for (let i = firstDayOfWeek; i <= lastDayOfWeek; i++) {
    count += birdsPerDay[i];
  }
  
  return count;
}

/**
 * Fixes the counting mistake by increasing the bird count
 * by one for every second day.
 *
 * @param {number[]} birdsPerDay
 * @returns {number[]} corrected bird count data
 */
export function fixBirdCountLog(birdsPerDay) {
   for (let i = 0; i < birdsPerDay.length; i += 2) {
    birdsPerDay[i] += 1;
   }

  return birdsPerDay;
}
