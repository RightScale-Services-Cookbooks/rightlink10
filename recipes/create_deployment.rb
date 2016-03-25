#requires curl to make api calls
package 'curl'



bash 'create_deployment' do
  flags '-x'
  cwd '/tmp'
  action :run
  code <<-EOH


  #Obtain Access Token for authenticated requests.
  access_token=`curl -s  \
  -H "X-API-Version:1.5" \
  --request POST "https://#{node['rightlink10']['api_endpoint']}/api/oauth2" \
  -d \"grant_type=refresh_token\" \
  -d \"refresh_token="#{node['rightlink10']['refresh_token']}"\" |cut -d "\\"" -f4 `

  #Create deployment if it does not already exists
  response=`curl -s --include \
  -H "X-API-Version:1.5" \
  -H "Authorization: Bearer $access_token" \
  -d \"deployment[name]="#{node['rightlink10']['deployment_name']}"\" \
  --request POST "https://#{node['rightlink10']['api_endpoint']}/api/deployments"`

  if [[ $response == *"already exists"* ]]
  then
    echo "The deployment already exists.";
  else
    echo "The deployment has been created.";
  fi

  EOH

end
