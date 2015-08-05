name             'rightlink10'
maintainer       'RightScale'
maintainer_email 'edwin@rightscale.com'
license          'All rights reserved'
description      'Enables/Disable/Upgrades rightlink10'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'rightlink10:enable', "Enables the RightLink 10 agent"
recipe 'rightlink10:diable', "Disables the RightLink 10 agent"
recipe 'rightlink10:upgrade',"Upgrades the RightLink 10 agent" 

attribute 'rightlink10/refresh_token',
  :display_name => 'RightScale Refresh Token',
  :description => 'The API Refresh Token',
  :type => 'string',
  :required => 'required',
  :recipes => ['rightlink10::enable', 'rightlink10::disable', 'rightlink10:upgrade']

attribute 'rightlink10/server_name',
  :display_name => 'RightScale Server Name',
  :description => 'The name associated with this server.',
  :type => 'string',
  :required => 'required',
  :recipes => ['rightlink10::enable']

attribute 'rightlink10/servertemplate_href',
  :display_name => 'RightScale ServerTemplate Href',
  :description => "The servertemplate to associate with this server",
  :type => 'string',
  :required => 'required',
  :recipes => ['rightlink10::enable']

attribute 'rightlink10/cloud',
  :display_name => 'Cloud Provider',
  :description => "The cloud provider",
  :type => 'string',
  :required => 'required',
  :recipes => ['rightlink10::enable']

attribute 'rightlink10/deployment_name',
  :display_name => 'Deployment Name',
  :description => "The deployment name where the server will be placed ",
  :type => 'string',
  :required => 'required',
  :recipes => ['rightlink10::enable']
