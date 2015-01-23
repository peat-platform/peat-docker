/**
 * Created by dmccarthy on 14/11/2013.
 */


'use strict';

var authApi = require('./main.js');
var os = require('os');

var dao_sink_addr = process.env.DAO_PORT_99999_TCP;
var m_handler_source_addr = 'tcp://'+os.networkInterfaces().eth0[0].address+':49917';
var m_handler_sink_addr = 'tcp://'+os.networkInterfaces().eth0[0].address+':49918';
var api_handler_source_addr = 'tcp://'+os.networkInterfaces().eth0[0].address+':49559';
var api_handler_sink_addr = 'tcp://'+os.networkInterfaces().eth0[0].address+':49559';

var config = {
   dao_sink        : {
      spec: dao_sink_addr ,
      bind:false,
      type:'push',
      id:'a'
   },
   mongrel_handler : {
      source : {spec: m_handler_source_addr , bind:false, id:'b', type:'pull', isMongrel2:true },
      sink   : {spec: m_handler_sink_addr , bind:false, id:'c', type:'pub', isMongrel2:true }
   },
   api_handler : {
      source : {spec : api_handler_source_addr , bind : true,  subscribe: '', type : 'sub', id : 'AuthSource'},
      sink   : {spec : api_handler_sink_addr , bind : false, subscribe: '', type : 'pub', id : 'AuthSink', asJson: true}
   },
   logger_params : {
      'path'     : '/opt/openi/cloudlet_platform/logs/crud_api',
      'log_level': 'debug',
      'as_json'  : false
   },
   key: {
      sign: '-----BEGIN RSA PRIVATE KEY-----\n'+
        'MIIBOQIBAAJBAKT8kGk6ZNo3sC4IIo29leRLVD23T2r0vWXBEkk2pV42HsxKAmPs\n'+
        '789AGHH9XwbGpD7FvrcBWWgb65v32Hg/NGkCAwEAAQJAVCNxShi7ggXQVUlUxdAf\n'+
        'dvNrnKW1XKg/Rns15hx2LRq+6oKv0RsPH3N4P64ZYDt62Yf0o1uLC66YtVgf5BgN\n'+
        'mQIhANCAIYQ3KSXLLmDW/wSCE85eOipP7Duxaan694LdO8+XAiEAypKs/I9t7Ef5\n'+
        'k4zpmm1/qS7ht/LWr+FsqHPB1nQ9m/8CIE19YXeHHLbcJbd+EDd3tK69HHb/Tzf8\n'+
        'Pt4a1QSA/qqvAiBLupGYyTXawv12P5OE+7Jh2Pjg/5NqpOcuAjhQp5vwmQIgNFWQ\n'+
        'km1fT/DDO4nwU7EP3WgBpn26E9eckdtgxIO+FEM=\n'+
        '-----END RSA PRIVATE KEY-----',
      verify: '-----BEGIN PUBLIC KEY-----\n'+
        'MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKT8kGk6ZNo3sC4IIo29leRLVD23T2r0\n'+
        'vWXBEkk2pV42HsxKAmPs789AGHH9XwbGpD7FvrcBWWgb65v32Hg/NGkCAwEAAQ==\n'+
        '-----END PUBLIC KEY-----'
   }
};

authApi(config); 
