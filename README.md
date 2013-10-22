S3-Pusher
=========

Publish assets to Amazon's S3 service.

[![Dependency Status](https://gemnasium.com/giuliandrimba/s3-pusher.png)](https://gemnasium.com/giuliandrimba/s3-pusher)

![Demo](https://dl.dropboxusercontent.com/u/4789686/s3-pusher/s3-pusher-anim.gif)

##Install

`npm install -g s3-pusher`
##Usage

`s3-pusher -a <access-key> -s <secret-key> -b <bucket-name> -d <source-directory>`

It will iterate over the directory files, and send them to the specified bucket.

##Contributing

Install the dependencies:

`make setup`

Watch the source files:

`make watch`
