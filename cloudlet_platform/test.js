/*
 * cloudlet_platform
 *
 *
 * Copyright (c) 2013 dmccarthy
 * Licensed under the MIT license.
 */

'use strict'

var argv  = require('commander')
var fs    = require('fs')

argv.version('0.0.1')
   .option('-w, --worker [value]', 'worker.')
   .option('-c, --config [value]', 'worker configuration.')
   .on('--help', function(){
      console.log('  Examples:');
      console.log('');
      console.log('    node main_worker.js -w dao -c \'{"name":"value"}\' ');
      console.log('');
   })
   .parse(process.argv);


if (!argv.worker || !argv.config){
   console.log('');
   console.log('Error: Missing parameters');
   console.log('');
   argv.help()
   return
}

var worker     = argv.worker
var config_str = argv.config

var config = config_str

//ensure that the configuration file is ASCII
config_str = config_str.replace(/[^\x00-\x7F]/g, "")

var config = JSON.parse(config_str)

if(config.trusted_security_framework_public_key){
   try {
      var data = JSON.parse(fs.readFileSync("conf.json", "UTF-8"));
      config.trusted_security_framework_public_key = data.trusted_security_framework_public_key
   }
   catch(e) {

   }

}

var workerMainFunction

switch (worker){
   case 'dao_proxy':
      worker = 'dao'
      workerMainFunction = require(worker).dao_proxy;
      break;
   case 'peat_rrd':
      workerMainFunction = require(worker).init;
      break;
   case 'https_redirect':
      worker = './https_redirect.js'
      workerMainFunction = require(worker);
      break;
   case 'swagger_def':
      worker = 'swagger-def'
      workerMainFunction = require(worker);
      break;
   default:
      workerMainFunction = require(worker);
      break;
}

if(undefined !== workerMainFunction){
   workerMainFunction(config)
}
else{
   console.log("Error: please specify a valid worker.... one of: dao, dao_proxy, http_redirect, swagger_def" )
}
