/**
 * Created by akeating on 16/1/2015.
 */


'use strict';

var attachmentApi = require('./main.js');

var config = {
   dao_sink        : { spec:'tcp://127.0.0.1:49999', bind:false, type:'push', id:'d' },
   mongrel_handler : {
      source : { spec:'tcp://127.0.0.1:49913', id:'e', bind:false, type:'pull', isMongrel2:true, error_handle:'tcp://127.0.0.1:49904' },
      sink   : { spec:'tcp://127.0.0.1:49914', id:'f', bind:false, type:'pub',  isMongrel2:true }
   },
   logger_params : {
      'path'     : '/opt/openi/cloudlet_platform/logs/attachment_api',
      'log_level': 'debug',
      'as_json'  : true
   },
   trusted_security_framework_public_key: '-----BEGIN PUBLIC KEY-----\n'+
         'MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKT8kGk6ZNo3sC4IIo29leRLVD23T2r0\n'+
         'vWXBEkk2pV42HsxKAmPs789AGHH9XwbGpD7FvrcBWWgb65v32Hg/NGkCAwEAAQ==\n'+
      '-----END PUBLIC KEY-----'
};


attachmentApi(config);
