cli = require "./cli"
version = require './utils/version'
Pusher = require "./pusher"
colors = require 'colors'

class S3Pusher

  constructor:()->


    {argv} = cli

    if !argv.access_key or !argv.secret_key or !argv.bucket or !argv.directory
      console.log "\nMissing required fields:\n".red

    if !argv.access_key
      console.log "* Access key required!\n".yellow

    if !argv.secret_key
      console.log "* Secret key required!\n".yellow

    if !argv.bucket
      console.log "* Bucket name required!\n".yellow

    if !argv.directory
      console.log "* Source directory required!\n".yellow

    if argv.version
      return console.log version

    else if (argv.directory and argv.access_key and argv.secret_key)
      @pusher = new Pusher argv.access_key, argv.secret_key, argv.bucket
      return @push argv.directory
    else
      console.log cli.help()

  push:(dir)->
    files = @pusher.push dir

module.exports = S3Pusher
