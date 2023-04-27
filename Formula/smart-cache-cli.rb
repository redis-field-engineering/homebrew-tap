class SmartCacheCli < Formula  
    desc "Redis Smart Cache CLI tool"
    homepage "https://github.com/redis-field-engineering/redis-smart-cache-cli"
    url "https://github.com/redis-field-engineering/redis-smart-cache-cli/archive/refs/tags/v0.0.10.tar.gz"
    sha256 "e5b53d10f328fd829f730483736e8ef64b589b38f5d0850ccf4b2199e5d14979"
    license "MIT"
    version "v0.0.10"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", "-o", bin/"smart-cache-cli", "."
    end
  
    test do    
        output = shell_output("#{bin}/smart-cache-clie -v")
        assert_match "Redis Smart Cache CLI Version: v0.0.10", output
    end
  end
  