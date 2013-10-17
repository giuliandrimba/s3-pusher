cli = require "./cli"
version = require './utils/version'
fsu = require "fs-util"

class S3Pusher

  constructor:()->

    {argv} = cli

    if argv.version
      return console.log version

    else if argv.directory
      return @push argv.directory

    else
      console.log cli.help()

  push:(dir)->
    console.log dir
    console.log fsu.ls dir

module.exports = S3Pusher
