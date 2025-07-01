# 🧠 What is the Default AWS Lambda Handler?

This document explains how the default Lambda handler works depending on how the function is created and deployed.

---

## ✅ 1. Default Handler When Using AWS Console (Python)

If you create a Lambda function using the **AWS Console** with the Python runtime, the default handler is:

```
lambda_function.lambda_handler
```

This means:

- **File**: `lambda_function.py`
- **Function**: `lambda_handler(event, context)`

```python
# lambda_function.py
def lambda_handler(event, context):
    return "Hello from Lambda!"
```

---

## ✅ 2. When Using AWS CLI or Deployment Tools (SAM, CDK, etc.)

When creating a function using the **AWS CLI**, **SAM**, **CDK**, or other infrastructure-as-code tools, you must explicitly specify the handler:

```bash
aws lambda create-function \
  --function-name my-func \
  --handler my_module.my_func \
  ...
```

> ❗ If you don’t specify it correctly, AWS will fail with a `Handler not found` error.

---

## ✅ 3. When Using Lambda Container Images

For container-based Lambda functions, there is **no default handler**.

You must define the handler in your `Dockerfile` or container `CMD` instruction:

```dockerfile
CMD ["my_module.my_handler"]
```

---

## 🔍 How to Check the Current Handler

Use the AWS CLI to retrieve your Lambda function’s configured handler:

```bash
aws lambda get-function-configuration \
  --function-name <your-function-name> \
  --query Handler
```

---

## 📌 Summary Table

| Use Case              | Handler                         |
|-----------------------|----------------------------------|
| Console + Python      | `lambda_function.lambda_handler` |
| CLI / SDK / SAM / CDK | Must specify explicitly          |
| Container Image       | Must define in image config      |
