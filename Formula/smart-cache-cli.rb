class RedisSmartCacheCli < Formula  
    desc "Redis Smart Cache CLI tool"
    homepage "https://github.com/redis-field-engineering/redis-smart-cache-cli"
    url "https://github.com/redis-field-engineering/redis-smart-cache-cli/archive/refs/tags/v0.0.5.tar.gz"
    sha256 "90810b8cc732bc950e30164ba1de9da95c77b020fa5cef99d36b23677e2d2c23"
    license "MIT"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", "-o", bin/"smart-cache-cli", "."
    end
  
    test do    
      system "true"
    end
  end
  