1. When you create a function from AWS Console (Python)
AWS sets the default handler to:

Copy
Edit
lambda_function.lambda_handler
This means:

File: lambda_function.py

Function: lambda_handler(event, context)

python
Copy
Edit
# lambda_function.py
def lambda_handler(event, context):
    return "Hello from Lambda!"
2. When you use AWS CLI or deployment tools (e.g., SAM, CDK, Serverless Framework)
You must explicitly define the handler:

bash
Copy
Edit
aws lambda create-function \
  --function-name my-func \
  --handler my_module.my_func \
  ...
If not specified, AWS will fail with Handler not found error.

3. When using a Lambda container image
There is no default handler — you define it in Dockerfile or with CMD, e.g.:

dockerfile
Copy
Edit
CMD ["my_module.my_handler"]
🔍 To Check Current Handler
bash
Copy
Edit
aws lambda get-function-configuration \
  --function-name <your-func-name> \
  --query Handler
📌 Summary
Use Case	Default Handler
Console + Python	lambda_function.lambda_handler
CLI / SDK	Must specify explicitly
Container Image	Must specify in image config

