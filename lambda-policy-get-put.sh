#Get Lambda's Execution Role

aws lambda get-function-configuration \
  --function-name {lambda-func} \
  --query 'Role' \
  --output text

#Create Inline Policy File

"""
Save the following JSON into a file called s3-access-policy.json

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource": "arn:aws:s3:::your-bucket-name/*"
    }
  ]
}
"""

#Attach Inline Policy to the Role


aws iam put-role-policy \
  --role-name service-role/{lambda-func-service-role} \
  --policy-name LambdaS3AccessPolicy \
  --policy-document file://s3-access-policy.json
