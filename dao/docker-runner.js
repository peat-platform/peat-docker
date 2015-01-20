/**
 * Created by akeating on 15/01/2015.
 */


'use strict';

var dao = require('./main.js');
var os = require('os');

var dao_sink_addr = 'tcp://'+os.networkInterfaces().eth0[0].address+':49999';
var dao_sub_sink_addr = process.env.NOTIF_PORT_49500_TCP;


var config = {
   dao_sink       : {spec: dao_sink_addr , bind:true, id:'q1', type:'pull' },
   sub_sink       : {spec: dao_sub_sink_addr , bind:false, id:'subpush', type:'pub' },
   logger_params  : {
      'path'      : '/opt/openi/cloudlet_platform/logs/dao',
      'log_level' : 'debug',
      'as_json'   : true
   }
};


dao(config);
