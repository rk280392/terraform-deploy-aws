cd ~/tf-projects
export AWS_PROFILE=learning
export TF_VAR_region=$(
  awk -F'= ' '/region/{print $2}' <(
    grep -A1 "\[.*$AWS_PROFILE\]" ~/.aws/config)
)
