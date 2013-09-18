#!/usr/bin/env node

program = require 'commander'
app = require './app'

program
  .version('0.0.1')
  .option('i, init', 'initialize a project')
  .option('g, generate', 'generate the static content')
  .parse(process.argv)


app.init() if program.init
app.generate() if program.generate
