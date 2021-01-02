const { getCountryStates, getAllNeighboringStates, getNeighboringStates } = require('usneighboringstates')

console.log("Result 1:");
console.log(getCountryStates());

console.log("Result 2:");
console.log(getAllNeighboringStates());

console.log("Result 3:");
var countryStateCode = "NY";
console.log(getNeighboringStates(countryStateCode));
