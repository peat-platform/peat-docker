/**
 * Created by akeating on 15/01/2015.
 */


'use strict';

var objectApi = require('./main.js');
var os = require('os');

var dao_sink_addr = process.env.DAO_PORT_49999_TCP;
var m_handler_sink_addr; // Points to mongrel2
var m_handler_source_addr = 'tcp://'+os.networkInterfaces().eth0[0].address+':49903';


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
      'path'     : '/opt/openi/cloudlet_platform/logs/object_api',
      'log_level': 'debug',
      'as_json'  : false
   },
   trusted_security_framework_public_key: '-----BEGIN PUBLIC KEY-----\n'+
         'MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKT8kGk6ZNo3sC4IIo29leRLVD23T2r0\n'+
         'vWXBEkk2pV42HsxKAmPs789AGHH9XwbGpD7FvrcBWWgb65v32Hg/NGkCAwEAAQ==\n'+
      '-----END PUBLIC KEY-----',
   monitoring : { 
      type : { 
         get  : ['id_only','resolve'],
         post : [],
         put  : [],
         delete : [] 
      }
   }
};


objectApi(config);
