'use strict';
var path          = require('path');
var redirect      = require('./https_redirect.js');

process.setMaxListeners(60);

process.on('uncaughtException', function (er) {
   console.error(er);
   if (undefined !== er){
      console.error(er.stack);
   }
   process.exit(1);
});

redirect(); 
