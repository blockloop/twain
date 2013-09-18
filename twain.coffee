#!/usr/bin/env node

program = require 'commander'
app = require './app'

program
  .version('0.0.1')
  .option('i, init', 'initialize a project')
  .option('g, generate', 'generate the static content')
  .option('s, server', 'start the local server')
  .option('n, new', 'generate a new blog post')
  #TODO .option('-w, --watch', 'watch for changes [when used with server]')
  .parse(process.argv)


# returns hault the code when the proper
# method is discovered
return app.init() if program.init
return app.generate() if program.generate

if program.new
  program.prompt 'name: ', (name) -> app.newPost(name) if name

