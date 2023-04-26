class SmartCacheCli < Formula  
    desc "Redis Smart Cache CLI tool"
    homepage "https://github.com/redis-field-engineering/redis-smart-cache-cli"
    url "https://github.com/redis-field-engineering/redis-smart-cache-cli/archive/refs/tags/v0.0.7.tar.gz"
    sha256 "e125aa0836ce726bbb7ef3249f10b318be3c71602d800e269c7e352d40d3395f"
    license "MIT"
    version "v0.0.7"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", "-o", bin/"smart-cache-cli", "."
    end
  
    test do    
        output = shell_output("#{bin}/smart-cache-clie -v")
        assert_match "Redis Smart Cache CLI Version: v0.0.7", output
    end
  end
  