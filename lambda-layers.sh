#Create and Publish the Lambda Layer
aws lambda publish-layer-version \
    --layer-name python-dependencies \
    --description "Python dependencies for web data generator (pandas, numpy, boto3)" \
    --zip-file fileb://dependencies-layer.zip \
    --compatible-runtimes python3.9

# Update Your Lambda Function to Use the Layer

aws lambda update-function-configuration \
    --function-name {lambda-function} \
    --layers "LAYER_VERSION_ARN"

# Update with the lightweight code package
aws lambda update-function-code \
    --function-name {lambda-function} \
    --zip-file fileb://lambda-function-light.zip



aws lambda publish-layer-version --layer-name python-dependencies --description "Python dependencies for web data generator" --zip-file fileb://dependencies-layer.zip --compatible-runtimes python3.9

#get layer

aws lambda get-function-configuration --function-name {lambda-function} --query 'Layers'
