aircall_mfa() {
  echo "Enter your 2FA token [ENTER]:"
  read mfa
  profile='aircall'
  eval `aws sts get-session-token --serial-number arn:aws:iam::232338174778:mfa/kevin --token-code $mfa --profile $profile | jq -r ". | {AWS_SECRET_ACCESS_KEY: .Credentials.SecretAccessKey, AWS_ACCESS_KEY_ID: .Credentials.AccessKeyId,     AWS_SESSION_TOKEN: .Credentials.SessionToken} | to_entries|map(\"export \(.key)=\(.value|tostring)\")|.[]"`
  unset 'export'
  export AWS_DEFAULT_REGION='us-west-1'
  export AWS_REGION='us-west-1'
}
