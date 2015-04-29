require 'serverspec'

set :backend, :exec

describe file('/etc/apache2/sites-enabled/HelloWorld.conf') do
  it { should be_file }
end

describe group("www-data") do
  it { should exist }
end

describe user("www-data") do
  it { should exist }
  it { should belong_to_group "www-data" }
end

describe file('/var/www/HelloWorld/index.php') do
  it { should be_file }
  it { should be_owned_by 'www-data' }
end

describe command ('cat /var/www/HelloWorld/index.php') do
  its(:exit_status) { should eq 0 }
end

describe package('apache2') do
  it { should be_installed }
end

describe service('apache2') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end
