script "install_plugin_es_head" do
	interpreter "bash"
	user "root"
	cwd "#{node.elasticsearch[:dir]}/elasticsearch-#{node.elasticsearch[:version]}/bin/"
	code <<-EOH
    plugin install -Dhttps.protocols='TLSv1.2' mobz/elasticsearch-head
  EOH
	not_if { File.exist?("#{node.elasticsearch[:dir]}/elasticsearch-#{node.elasticsearch[:version]}/plugins/head") }
end

#notifies :restart, 'service[elasticsearch]' unless node.elasticsearch[:skip_restart]
