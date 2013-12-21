
module.exports = (lineman) ->
  conf = lineman.config.application

  config:
    removeTasks:
      common: conf.removeTasks.common.concat("pages:dev")
      dist: conf.removeTasks.dist.concat("pages:dist")
