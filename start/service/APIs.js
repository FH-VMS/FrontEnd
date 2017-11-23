
var apiService = require('./apiService');
const api = {
  Base: {
      GetAll: function (data) {
          return apiService('weather', 'json.shtml', 'GET', data)
      }
  }
}
 
module.exports = api;
	
