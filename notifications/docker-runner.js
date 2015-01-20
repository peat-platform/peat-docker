/**
 * Created by akeating on 15/01/2015.
 */


'use strict';

var notifications  = require('./main.js');
var os = require('os');

var dao_sink_addr = process.env.DAO_PORT_49999_TCP;

var notif_sink_addr =  'tcp://'+os.networkInterfaces().eth0[0].address+':49500';
var notif_broadcaster_addr; // Points to something?

var m_handler_sink_addr; // Points to mongrel2
var m_handler_source_addr = 'tcp://'+os.networkInterfaces().eth0[0].address+':49503';
var m_handler_sub_source = 'tcp://'+os.networkInterfaces().eth0[0].address+':49505';
var m_handler_sub_sink; // Points to mongrel2

var comms_sink_addr; // No idea

var config = {

   notif_sink : {spec : notif_sink_addr , bind : true, type : 'sub', subscribe : '', id : 'NotifReceiver'},
   notif_broadcaster : {spec : notif_broadcaster_addr , bind : true, type : 'pub', id : 'NotificationBroadcaster'},
   
   dao_sink        : { spec: dao_sink_addr , bind:false, type:'push', id:'dao_sink' },
   mongrel_handler : {
      source    : { spec : m_handler_source_addr , id : 'e', bind : false, type : 'pull', isMongrel2 : true },
      sink      : { spec : m_handler_sink_addr , id : 'NotifRec', bind : false, type : 'pub', isMongrel2 : true},
      subsource : { spec : m_handler_sub_source_addr , id : 'f', bind : false, type : 'pull', isMongrel2 : true },
      subsink   : { spec : m_handler_sub_sink_addr , id : 'subRec', bind : false, type : 'pub', isMongrel2 : true }
   },
   comms           : {
      sink : { spec : comms_sink_addr , bind : false, type : 'push', id : 'communication_id' }
   },
   logger_params   : {
      'path'      : '/opt/openi/cloudlet_platform/logs/notification.log',
      'log_level' : 'debug',
      'as_json'   : false
   }
};


notifications(config);
