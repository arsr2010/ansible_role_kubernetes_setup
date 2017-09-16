puts ("==============================")
puts ("Role test")
puts ("kubernetes_setup: #{ ENV['CONN_NAME'] }")
puts ("==============================")

system("cd spec && rm -rf host_vars")
system("cd spec && cp -r host_vars_dirs/host_vars_01 host_vars")
system("cd spec && ansible-playbook -i inventory site.yml")

sleep 120 

require 'spec_helper'
file_dir = File.dirname(__FILE__)

describe ("check kubectl setting of master node") do
  describe command("kubectl config get-clusters") do
    its(:stdout) { should match /^default-cluster$/ }
  end
  describe command("kubectl config get-contexts | grep default-context") do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /^\*/ }
    its(:stdout) { should match /default-cluster/ }
    its(:stdout) { should match /default-admin/ }
    its(:stdout) { should match /default-namespace/ }
  end
end

describe ("check dashboard is deployed") do
  describe command("kubectl get deployments -n kube-system | grep kubernetes-dashboard | awk '{ print $5 }'") do
    its(:stdout) { should match /^[1-9][0-9]*$/ }
  end
  describe command("kubectl get services -n kube-system") do
    its(:stdout) { should match /kubernetes-dashboard/ }
  end
end
