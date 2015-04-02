/**
 * Created by akeating on 16/1/2015.
 */

'use strict';

var dao = require('./main.js');

var config = {
   dao_sink       : {spec:'tcp://127.0.0.1:49997', bind:false, id:'q1', type:'pull' },
   sub_sink       : {spec:'tcp://127.0.0.1:49500', bind:false, id:'subpush', type:'pub' },
   logger_params  : {
      'path'      : '/opt/openi/cloudlet_platform/logs/dao',
      'log_level' : 'debug',
      'as_json'   : true
   }
};


dao(config);
