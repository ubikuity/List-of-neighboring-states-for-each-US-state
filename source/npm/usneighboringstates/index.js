exports.getCountryStates = function() {
  const usStatesJson = require('./us-states.json');
  return usStatesJson;
}

exports.getAllNeighboringStates = function() {
  const allNeighboringStatesJson = require('./neighbor-states.json');
  return allNeighboringStatesJson;
}

exports.getNeighboringStates = function(countryStateCode) {
  const allNeighboringStatesJson = require('./neighbor-states.json');
  var neighboringStates = allNeighboringStatesJson.filter(x => x.code === countryStateCode);
  return neighboringStates;
}
