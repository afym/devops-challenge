chmod +x scripts/before
aws s3 cp appspec.yml s3://application-retail-cd/appspec.yml
aws s3 cp scripts s3://application-retail-cd/scripts --recursive