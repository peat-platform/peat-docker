/**
 * Created by akeating on 16/1/2015.
 */


'use strict';

var swaggerDef = require('./main.js');

var args = process.argv.slice(2);

if (args.length > 0){
   var args_str = args.join(' ')

   args_str = args_str.replace(/[^\x00-\x7F]/g, "")

   var config = JSON.parse(args_str)
   swaggerDef(config);
}
else {
   console.log("Error: configuration parameters expected.")
}


