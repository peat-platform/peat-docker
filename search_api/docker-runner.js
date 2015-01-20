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
   dao_sink        : { spec: dao_sink_addr , bind:false, type:'push', id:'d' },
   mongrel_handler : {
      source : { spec: m_handler_source_addr , id:'e', bind:false, type:'pull', isMongrel2:true, error_handle:'tcp://127.0.0.1:49904' },
      sink   : { spec: m_handler_sink_addr , id:'f', bind:false, type:'pub',  isMongrel2:true }
   },
   logger_params : {
      'path'     : '/opt/openi/cloudlet_platform/logs/search_api',
      'log_level': 'debug',
      'as_json'  : true
   },
   trusted_security_framework_public_key: '-----BEGIN PUBLIC KEY-----\n'+
      'MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKT8kGk6ZNo3sC4IIo29leRLVD23T2r0\n'+
      'vWXBEkk2pV42HsxKAmPs789AGHH9XwbGpD7FvrcBWWgb65v32Hg/NGkCAwEAAQ==\n'+
      '-----END PUBLIC KEY-----'
};


typeApi(config);
