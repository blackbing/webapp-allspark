var _ = require('lodash');
function _require(module){
  delete require.cache[require.resolve(module)]
  return require(module)
}


var app_env = _require('./conf/env.json');
if(process.env.NODE_ENV == 'production'){
  prod_env = _require('./conf/prod_env.json');
  app_env = _.extend( app_env, prod_env);
}

function setup_env_config(config_obj){
  for(var key in config_obj){
    var value = config_obj[key];
    process.env[key] = value;
    exports[key] = value;
  }
}

setup_env_config(app_env);
