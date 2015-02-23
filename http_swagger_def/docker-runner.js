/**
 * Created by akeating on 16/1/2015.
 */


'use strict';

var swaggerDef = require('./main.js');

var config = {
   mongrel_handler : {
      source : { spec:'tcp://127.0.0.1:48907', id:'g', bind:false, type:'pull', isMongrel2:true, error_handle:'tcp://127.0.0.1:49904' },
      sink   : { spec:'tcp://127.0.0.1:48908', id:'h', bind:false, type:'pub',  isMongrel2:true }
   },
   logger_params : {
      'path'     : '/opt/openi/cloudlet_platform/logs/swagger-def',
      'log_level': 'info',
      'as_json'  : true
   }
};


swaggerDef(config);
