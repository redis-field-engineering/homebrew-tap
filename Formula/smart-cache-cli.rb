class SmartCacheCli < Formula  
    desc "Redis Smart Cache CLI tool"
    homepage "https://github.com/redis-field-engineering/redis-smart-cache-cli"
    url "https://github.com/redis-field-engineering/redis-smart-cache-cli/archive/refs/tags/v0.0.11.tar.gz"
    sha256 "50f88f56f15d42b5d3c997178bc28a161c874a010b5b002557ee69fb4b728220"
    license "MIT"
    version "v0.0.11"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", "-o", bin/"smart-cache-cli", "."
    end
  
    test do    
        output = shell_output("#{bin}/smart-cache-clie -v")
        assert_match "Redis Smart Cache CLI Version: v0.0.11", output
    end
  end
  