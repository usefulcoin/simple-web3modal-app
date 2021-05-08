#! /bin/bash
#
# script name: deploy.bash
# script author: munair simpson
# script created: 20210508
# script purpose: deploy simple-web3modal-app to S3 bucket

# step 5: copy to S3 bucket
aws s3 sync ./* s3://simple-web3modal-app
