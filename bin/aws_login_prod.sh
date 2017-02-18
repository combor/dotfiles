export AWS_ACCESS_KEY_ID=$(pass amazon/prod/AWS_ACCESS_KEY_ID)
export AWS_SECRET_ACCESS_KEY=$(pass amazon/prod/AWS_SECRET_ACCESS_KEY)
export AWS_DEFAULT_REGION=eu-west-1
export AWS_REGION=eu-west-1
export AWS_ACCOUNT=prod
export PAAS_CF_DIR="/go/src/github.com/alphagov/paas-cf"
"${PAAS_CF_DIR}/scripts/create_sts_token.sh" && source "${HOME}/.aws_sts_tokens/${AWS_ACCOUNT}.sh"
