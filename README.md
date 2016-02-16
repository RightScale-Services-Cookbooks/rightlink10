# rightlink10

[![Build Status](https://travis-ci.org/RightScale-Services-Cookbooks/rightlink10.svg?style=flat)][travis]
[travis]: https://travis-ci.org/RightScale-Services-Cookbooks/rightlink10
====================
Provides recipes to enable and disable RightScale's RightLink 10 agent .

Github Repository: [https://github.com/RightScale-Services-Cookbooks/rightlink10](https://github.com/RightScale-Services-Cookbooks/rightlink10)

Requirements
------------
Access to https://rightlink.rightscale.com from the server.


Usage
-----
#### rightlink10::enable
Add to your runlist to enable rightlink10

#### rightlink10::disable
Add to your runlist to disable rightlink10.



# Recipes
<table>
  <tr>
    <th>Recipe</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>['rightlink10']['enable']</tt></td>
    <td>Enables RightLink 10</td>
  </tr>
  <tr>
    <td><tt>['rightlink10']['disable']</tt></td>
    <td>Disables RightLink 10</td>
  </tr>
</table>

# Attributes

- `node['rightlink10']['refresh_token']` - The RightScale refresh token
- `node['rightlink10']['server_name']` - The name to associate with the server
- `node['rightlink10']['servertemplate_href']` -  The servertemplate to associate with the server
- `node['rightlink10']['cloud']` - The cloud provider of the server
- `node['rightlink10']['deployment_name']` - The deployment name
- `node['rightlink10']['version']` - The rightlink version  e.g. 10.3.0


Contributing
------------
- 1. Fork the repository on Github
- 2. Create a named feature branch (like `add_component_x`)
- 3. Write your change
- 4. Write tests for your change (if applicable)
- 5. Run the tests, ensuring they all pass
- 6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: [@gonzalez](http://github.com/gonzalez)
