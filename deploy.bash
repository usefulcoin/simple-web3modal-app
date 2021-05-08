#! /bin/bash
#
# script name: deploy.bash
# script author: munair simpson
# script created: 20210508
# script purpose: deploy simple-web3modal-app to gh-pages or S3 bucket

read -p "Push to staging on gh-pages? (https enabled by default) [yes]: " staging
read -p "Push to production on AWS S3? (https not enabled by default) [yes]: " production

staging=${staging:-"yes"}
production=${production:-"yes"}

# step 1: push to GitHub Pages (**staging**)
if [ $staging == "yes" ]; then git push origin main:gh-pages ; fi

# step 2: copy to S3 bucket (**production**)
if [ $production == "yes" ]; then aws s3 sync . s3://simple-web3modal-app ; fi
