module.exports = (lineman) ->
  config:
    server:
      staticRoutes:
        '/javascripts/lineman': 'js'
        '/stylesheets/lineman': 'css'
        # '/fonts': ''
        # '/images': ''

      apiProxy:
        enabled: true
        host: 'localhost'
        port: 3000
