# Common Lambda errors

## 1. Zipped package file is larger than 250 MB

The package is too large (334MB) - AWS Lambda has a 250MB limit! This is common with pandas. Use AWS Lambda Layers to avoid this issue.

## 2. Pandas not found - Unable to import

`RUNTIME=$(aws lambda get-function-configuration \
            --function-name omnis-web-data-gen  \
            --query 'Runtime' --output text)`

`echo "Detected runtime: $RUNTIME"`
`#Detected runtime: python3.13`

### 2.1 Your Lambda runtime is Python 3.13, but your existing layer is built for Python 3.9 — that’s why the error occurs:

❌ Mismatch between Lambda runtime and layer build version
No module named 'pandas' happens because /opt/python/lib/python3.9/site-packages is not in the Python 3.13 path.

## 3. Unable to import handler

`
{
  "errorMessage": "Unable to import module 'lambda_function': No module named 'lambda_function'",
  "errorType": "Runtime.ImportModuleError",
  "requestId": "",
  "stackTrace": []
}
`

### Solution 

# Update the handler to point to the correct file and function
`aws lambda update-function-configuration \
    --function-name omnis-web-data-gen \
    --handler lambda_handler.lambda_handler`

📌 In short:

`aws lambda update-function-configuration \
  --function-name my-lambda-function \
  --handler my_module.my_function`
  
This tells AWS Lambda:

“When this function is invoked, go to the file my_module.py and run the function named my_function.”
