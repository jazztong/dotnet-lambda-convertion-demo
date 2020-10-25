NAME ?= LambdaWebApp
REGION ?= ap-southeast-1
PROJECT ?=
BUCKET_NAME ?= my-serverless-bucket-3434

bucket:
	aws s3 mb s3://${BUCKET_NAME}

app:
	dotnet lambda deploy-serverless ${NAME} -sb ${BUCKET_NAME}

kill:
	dotnet lambda delete-serverless ${NAME}
	aws s3 rm s3://${BUCKET_NAME}

run:
	docker run -v $(PWD):/aws --entrypoint bash  -it --name corelab amazon/aws-cli

run-sdk:
	docker run -v $(PWD):/usr/src --entrypoint bash  -it --name corelabcore mcr.microsoft.com/dotnet/core/sdk:3.1
