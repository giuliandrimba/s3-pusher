fs = require "fs"
fsu = require "fs-util"
s3 = require "s3"
mime = require "mime"
AWS = require "aws-sdk"
colors = require 'colors'

class Pusher

  ACCESS_KEY:""
  SECRET_KEY:""
  BUCKET:""

  total:0
  files:[]

  constructor:(@ACCESS_KEY, @SECRET_KEY, @BUCKET)->

    AWS.config.update({accessKeyId: @ACCESS_KEY, secretAccessKey:  @SECRET_KEY});
    @aws = new AWS.S3 params: {Bucket:@BUCKET}

  initialize:(callback)->

    @aws.listBuckets (err, data)=>

      exists = false

      for bucket in data.Buckets
        if bucket.Name is @BUCKET
          exists = true

      if exists
        callback()
      else
        @create(callback)

  create:(callback)->
    console.log "Creating bucket...".green
    @aws.createBucket Bucket:@BUCKET, callback

  push:(dir)->
    console.log "Uploading files!".green
    @ls dir, null, @files

    @total = @files.length

    @initialize ()=>
      @client = s3.createClient key:@ACCESS_KEY, secret:@SECRET_KEY, bucket:@BUCKET
      @upload file.file, file.type for file in @files


  upload:(file, type)->
    header = 'Content-Type':type, 'x-amz-acl':'public-read'
    uploader = @client.upload file, file, header

    uploader.on "error", (err)->
      console.log "Unable to upload: #{err.stack}".red

    uploader.on "progress", (amountDone, amountTotal)->
      console.log "Progress: #{amountDone} of #{amountTotal}".yellow

    uploader.on "end", (url)->
      console.log "File avaliable at: #{url}".green
      process.exit(1);

  ls:(dir, filter, files)->

    fls = fsu.ls dir

    for file in fls

      if fs.lstatSync(file).isDirectory()
        @ls file, null, files
      else
        type = mime.lookup file

        if filter
          files.push(file:file, type:type) if filter.test file
        else
          files.push(file:file, type:type)

    return files



module.exports = Pusher
