class SmartCacheCli < Formula  
    desc "Redis Smart Cache CLI tool"
    homepage "https://github.com/redis-field-engineering/redis-smart-cache-cli"
    url "https://github.com/redis-field-engineering/redis-smart-cache-cli/archive/refs/tags/v0.0.8.tar.gz"
    sha256 "2394489b14622142fe561ef6cf4ae29997f4af9adbc26d259611d3fe657fd398"
    license "MIT"
    version "v0.0.8"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", "-o", bin/"smart-cache-cli", "."
    end
  
    test do    
        output = shell_output("#{bin}/smart-cache-clie -v")
        assert_match "Redis Smart Cache CLI Version: v0.0.8", output
    end
  end
  