aws lambda invoke \
    --function-name {func-name} \
    --payload file://examples/basic-payload.json \
    response.json

"""
{"errorMessage": "Unable to import module 'lambda_function': No module named 'lambda_function'", "errorType": "Runtime.ImportModuleError", "requestId": "", "stackTrace": []}%             simrangulat@Simrans-MacBook-Pro-2 omnis-webData % aws lambda update-function-configuration \
"""

aws lambda update-function-configuration \
    --function-name omnis-web-data-gen \
    --handler lambda_handler.lambda_handler
