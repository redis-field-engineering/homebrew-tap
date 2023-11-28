class SmartCacheCli < Formula  
    desc "Redis Smart Cache CLI tool"
    homepage "https://github.com/redis-field-engineering/redis-smart-cache-cli"
    url "https://github.com/redis-field-engineering/redis-smart-cache-cli/archive/refs/tags/v0.0.12.tar.gz"
    sha256 "40ca0fa8fd718da17d063479fb5733549c76a1b2dcf16343b206a88b7e393271"
    license "MIT"
    version "v0.0.11"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", "-o", bin/"smart-cache-cli", "."
    end
  
    test do    
        output = shell_output("#{bin}/smart-cache-clie -v")
        assert_match "Redis Smart Cache CLI Version: v0.0.12", output
    end
  end
  