class Domain
  def self.load domain_config
    base_hash = Parse.yaml_file domain_config
    domain  = base_hash["domain"]
    port = base_hash["port"]
    @@base_url = "#{domain.chomp('\\')}#{ port.present? ? ":#{port}" : "" }"
  end

  def self.base_url
    @@base_url
  end
end
