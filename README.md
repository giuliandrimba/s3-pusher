S3-Pusher
=========

Publish assets to Amazon's S3 service.

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
