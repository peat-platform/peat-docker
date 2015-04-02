/**
 * Created by akeating on 16/1/2015.
 */

'use strict';

var dao = require('./main.js');


var config = {
   frontend      : 'tcp://127.0.0.1:49999',
   backend       : 'tcp://127.0.0.1:49997'
};

dao.dao_proxy(config);