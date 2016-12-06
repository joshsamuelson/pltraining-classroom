require 'spec_helper_acceptance'

describe 'fundamentals' do
    before(:all) do
      sleep_until_pe_started(master, 10)
      on master, "echo 'node default { include classroom::course::fundamentals }' > /etc/puppetlabs/code/environments/production/manifests/site.pp"
    end


    it 'runs with changes' do
      on master, "puppet agent -t", :acceptable_exit_codes => [2]
    end

    it 'runs idempotently' do
      on master, "puppet agent -t", :acceptable_exit_codes => [0]
    end

end
