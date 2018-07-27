## aws_cli

aws-cli tool to access aws resources from cimple small docker container

### Usage

Just run container with defined commands like this
```
command:
- aws s3 ls s3://backet/
```

Also there is possibility to define multiline command like this
```
command:
- |
  aws s3 ls s3://backet-1/
  aws s3 ls s3://backet-2/
  aws s3 ls s3://backet-2/
  whoami
  ls -l /
  uname -a
```


### Variables
aws can use environment variables to define `access_key_id` and `secret_access_key`, here is short list of basic variables that can be used

| Variable | Description |
| -------- | ----------- | 
| `AWS_ACCESS_KEY_ID` | set `access_key_id` to access aws resources |
| `AWS_SECRET_ACCESS_KEY` | set `secret_access_key` to access aws resources |
| `AWS_REGION` | set aws region where resources located |
