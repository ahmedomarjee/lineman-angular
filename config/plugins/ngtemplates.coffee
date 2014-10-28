module.exports = (lineman) ->

  config:
    loadNpmTasks: lineman.config.application.loadNpmTasks.concat("grunt-angular-templates")

    removeTasks:
      common: lineman.config.application.removeTasks.common.concat("handlebars", "jst")

    prependTasks:
      common: lineman.config.application.prependTasks.common.concat("ngtemplates")

    ngtemplates:
      app:
        options:
          base: "<%= files.ngtemplates.base %>"
        src: "<%= files.ngtemplates.src %>"
        dest: "<%= files.ngtemplates.dest %>"

    watch:
      ngtemplates:
        files: "<%= files.ngtemplates.src %>",
        tasks: ["ngtemplates", "concat_sourcemap:js"]

  files:
    ngtemplates:
      base: "src/app"
      src: "src/app/**/*.html"
      dest: "generated/angular/template-cache.js"

    template:
      generated: "<%= files.ngtemplates.dest %>"