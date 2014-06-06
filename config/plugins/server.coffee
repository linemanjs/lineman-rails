path = require('path')

module.exports = (lineman) ->
  userRailsConfig = require(path.join(process.cwd(), 'config', 'application'))?(lineman)?.plugins?.rails

  config:
    server:
      staticRoutes: staticRoutesToMount(userRailsConfig)
      apiProxy:
        enabled: true
        host: 'localhost'
        port: 3000

staticRoutesToMount = (config = {}) ->
  namespace = if n = config.namespace then "/#{n}" else ""
  staticRoutes = {}
  staticRoutes["/javascripts/lineman#{namespace}"] = 'js'
  staticRoutes["/stylesheets/lineman#{namespace}"] = 'css'
  staticRoutes
