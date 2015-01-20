/**
 * Created by akeating on 15/01/2015.
 */


'use strict';

var typeApi = require('./main.js');
var os = require('os');

var dao_sink_addr = process.env.DAO_PORT_49999_TCP;
var m_handler_sink_addr; // Points to mongrel2
var m_handler_source_addr = 'tcp://'+os.networkInterfaces().eth0[0].address+':49911';


var config = {
   dao_sink        : {
      spec: dao_sink_addr ,
      bind:false,
      type:'push',
      id:'a'
   },
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
      'path'     : '/opt/openi/cloudlet_platform/logs/type_api',
      'log_level': 'debug',
      'as_json'  : false
   },
   monitoring : { 
      type : { 
         get  : ['id_only'],
         post : [],
         put  : [],
         delete : [] 
      }
   }
};


typeApi(config);
