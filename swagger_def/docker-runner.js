/**
 * Created by akeating on 15/01/2015.
 */


'use strict';

var swaggerDef = require('./main.js');
var os = require('os');

var m_handler_sink_addr; // Points to mongrel2
var m_handler_source_addr = 'tcp://'+os.networkInterfaces().eth0[0].address+':49907';


var config = {
   mongrel_handler : {
      source : {
         spec: m_handler_source_addr ,
         bind:false, id:'b',
         type:'pull',
         isMongrel2:true
      },
      sink   : {
         spec: m_handler_sink_addr ,
         bind:false,
         id:'c',
         type:'pub',
         isMongrel2:true
      }
   },
   logger_params : {
      'path'     : '/opt/openi/cloudlet_platform/logs/swagger-def',
      'log_level': 'debug',
      'as_json'  : false
   }
};


swaggerDef(config);
