glob = require('glob').sync
_ = require 'lodash'
Fs = require 'fs-extra'
Path = require 'path'
config = require './twain.json'
urlify = require('urlify').create
  spaces:"-"
  trim:true


module.exports.init = ->
  console.log 'doing init...'
  return console.error 'Hmm. This directory has already been initialized' if Fs.existsSync './twain.json'
  Fs.copy(Path.join(__dirname, 'twain.json'), './twain.json', (err) -> throw err if err)
  Fs.mkdirp './src/posts/', (err) -> throw err if err
  Fs.mkdirp './src/images/', (err) -> throw err if err


module.exports.generate = ->
  console.log 'doing generate...'
  Fs.mkdirpSync './site/images'
  posts = _.map glob('./src/posts/**'), (post) -> postToObj(post)


module.exports.newPost = (name) ->
  console.log "creating new blog named #{name}"



#
# Private methods
#

postToObj = (dir) ->
  result = {}
  config = require './' + Path.join(dir, 'config.json')
  _.extend result, config
  result.title ?= urlify Path.basename(dir)
  result.content = Fs.readFileSync Path.join(dir, 'content.md')

