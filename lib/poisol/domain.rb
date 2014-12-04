class Domain
  def load domain_config
    base_hash = Parse.yaml_file domain_config
    domain  = base_hash["domain"]
    port = base_hash["port"]
    "#{domain.chomp('\\')}#{ port.present? ? ":#{port}" : "" }"
  end

end
