/**
 * Created by akeating on 15/01/2015.
 */


'use strict';

var commsComponent = require('./main.js');
var os = require('os');

var sink_addr = process.env.DAO_PORT_49999_TCP;
var websocket_sink_addr = 'tcp://'+os.networkInterfaces().eth0[0].address+':49908';
var websocket_source_addr = 'tcp://'+os.networkInterfaces().eth0[0].address+':49907';


var config = {
   sms           : { accountSid:'AC952cebd3bbdfe9f08ab835c7c9ec7a04', authToken:'a1a77757930e53545fd3ba29a3e12a67' },
   email         : { type : 'SMTP', service: 'Gmail', user: 'openi.notifications@gmail.com', pass: '3oP1l2nPbF9EVUL' },
   sink          : { spec: sink_addr , bind:true, type:'pull', id:'communication_id' },
   websocket : {
      source : { spec: websocket_source_addr , id:'socket_source', bind:false, type:'pull', isMongrel2:true },
      sink   : { spec: websocket_sink_addr , id:'socket_sink',   bind:false, type:'pub',  isMongrel2:true }
   },
   logger_params : {
      'path'     : '/opt/openi/cloudlet_platform/logs/communications',
      'log_level': 'debug',
      'as_json'  : true
   }
}

commsComponent(config);
 
