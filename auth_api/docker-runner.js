/**
 * Created by akeating on 20/01/2015.
 */


'use strict';

var authApi = require('./main.js');
var os = require('os');

var dao_sink_addr = process.env.DAO_PORT_99999_TCP;

var m_handler_source_addr = 'tcp://'+os.networkInterfaces().eth0[0].addres$
var m_handler_sink_addr = 'tcp://'+os.networkInterfaces().eth0[0].address+$

var api_handler_source_addr = 'tcp://'+os.networkInterfaces().eth0[0].addr$
var api_handler_sink_addr = 'tcp://'+os.networkInterfaces().eth0[0].addres$

var config = {
   dao_sink        : {
      spec: dao_sink_addr ,
      bind:false,
      type:'push',
      id:'a'
   },
   mongrel_handler : {
      source : {spec: m_handler_source_addr , bind:false, id:'b', type:'pu$
      sink   : {spec: m_handler_sink_addr , bind:false, id:'c', type:'pub'$
   },
   api_handler : {
      source : {spec : api_handler_source_addr , bind : true,  subscribe: $
      sink   : {spec : api_handler_sink_addr , bind : false, subscribe: ''$
   },
   logger_params : {
      'path'     : '/opt/openi/cloudlet_platform/logs/crud_api',
      'log_level': 'debug',
      'as_json'  : false
   },
   key: {
      sign: '-----BEGIN RSA PRIVATE KEY-----\n'+
        'MIIBOQIBAAJBAKT8kGk6ZNo3sC4IIo29leRLVD23T2r0vWXBEkk2pV42HsxKAmPs\$
        '789AGHH9XwbGpD7FvrcBWWgb65v32Hg/NGkCAwEAAQJAVCNxShi7ggXQVUlUxdAf\$
        'dvNrnKW1XKg/Rns15hx2LRq+6oKv0RsPH3N4P64ZYDt62Yf0o1uLC66YtVgf5BgN\$
        'mQIhANCAIYQ3KSXLLmDW/wSCE85eOipP7Duxaan694LdO8+XAiEAypKs/I9t7Ef5\$
        'k4zpmm1/qS7ht/LWr+FsqHPB1nQ9m/8CIE19YXeHHLbcJbd+EDd3tK69HHb/Tzf8\$
        'Pt4a1QSA/qqvAiBLupGYyTXawv12P5OE+7Jh2Pjg/5NqpOcuAjhQp5vwmQIgNFWQ\$
        'km1fT/DDO4nwU7EP3WgBpn26E9eckdtgxIO+FEM=\n'+
        '-----END RSA PRIVATE KEY-----',
      verify: '-----BEGIN PUBLIC KEY-----\n'+
        'MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKT8kGk6ZNo3sC4IIo29leRLVD23T2r0\$
        'vWXBEkk2pV42HsxKAmPs789AGHH9XwbGpD7FvrcBWWgb65v32Hg/NGkCAwEAAQ==\$
        '-----END PUBLIC KEY-----'
   }
};
 
