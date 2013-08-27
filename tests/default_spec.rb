include MiniTest::Chef::Resources
include MiniTest::Chef::Assertions

class PhpSpec < MiniTest::Chef::Spec
  describe_recipe 'php::default' do
    it 'installs a php binary' do
      assert File.exist?("/usr/bin/php")
    end

    if node[:php][:install_method] == "package"
      it 'installs the packages listed in the node attributes' do
        node[:php][:packages].each do |p|
          package(p).must_be_installed
        end 
      end
    end
  end
end
