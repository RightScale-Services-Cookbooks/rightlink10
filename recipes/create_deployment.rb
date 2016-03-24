
package 'curl'

bash "create deployment" do
  code <<-EOH
  #token_endpoint="https://#{node['rightlink10']['api_endpoint']}/api/oauth2"
  #rs_refresh_token="#{node['rightlink10']['refresh_token']}"

  #Obtain Access Token for authenticated requests.
  access_token=`curl -s  \
  -H "X-API-Version:1.5" \
  --request POST "https://#{node['rightlink10']['api_endpoint']}/api/oauth2" \
  -d "grant_type=refresh_token" \
  -d "refresh_token==#{node['rightlink10']['refresh_token']}" |cut -d "\"" -f4`

  #Create deployment if it does not already exists
  response=`curl -s --include \
  -H "X-API-Version:1.5" \
  -H "Authorization: Bearer $access_token" \
  -d 'deployment[name]=easdfasdfasdfasdfaddsdfasdfasdfasdddfaddsdf' \
  --request POST "https://#{node['rightlink10']['api_endpoint']}/api/deployments"`

  if [[ $response == *"already exists"* ]]
  then
    echo "The deployment already exists.";
  else
    echo "The deployment has been created.";
  fi
  EOH

end
