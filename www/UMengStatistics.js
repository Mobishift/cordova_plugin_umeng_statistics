var exec = require('cordova/exec');

var noop = function(){};
exports.exec = function(action, arg0, success, error) {
    exec(success, error, "UMengStatistics", action, [arg0]);
};

exports.pageStart = function(pageName){
	exports.exec('pageStart', pageName, noop, noop);
};

exports.pageEnd = function(pageName){
	exports.exec('pageEnd', pageName, noop, noop);
};

exports.pageEvent = function(eventId){
	exports.exec('pageEvent', eventId, noop, noop);
};