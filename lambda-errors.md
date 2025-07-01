# Common Lambda errors

## 1. Zipped package file is larger than 250 MB

The package is too large (334MB) - AWS Lambda has a 250MB limit! This is common with pandas. Use AWS Lambda Layers to avoid this issue.

## 2. Pandas not found - Unable to import

`RUNTIME=$(aws lambda get-function-configuration \
            --function-name omnis-web-data-gen  \
            --query 'Runtime' --output text)`

`echo "Detected runtime: $RUNTIME"`
Detected runtime: python3.13

