# Common Lambda errors

## 1. Zipped package file is larger than 250 MB

The package is too large (334MB) - AWS Lambda has a 250MB limit! This is common with pandas. Use AWS Lambda Layers to avoid this issue.
