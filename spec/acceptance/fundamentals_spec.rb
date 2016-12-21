require 'spec_helper_acceptance'

describe 'fundamentals' do
    before(:all) do
      on master, "echo 'node default { include classroom::course::fundamentals }' > /etc/puppetlabs/code/environments/production/manifests/site.pp"
    end


    it 'first puppet run' do
      sleep_until_puppetserver_started(master)
      on master, "puppet agent -t", :acceptable_exit_codes => [2]
    end
    
    it 'second puppet run' do
      on master, "puppet agent -t", :acceptable_exit_codes => [0]
    end

    it 'runs idempotently' do
      on master, "puppet agent -t", :acceptable_exit_codes => [0]
    end

end
